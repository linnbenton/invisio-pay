// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@fhenixprotocol/contracts/FHE.sol";

contract InvisioPay {
    struct Milestone {
        euint32 encryptedBudget;      // Anggaran rahasia (FHE)
        euint8 encryptedTargetScore;  // Target performa rahasia (FHE)
        bool isCompleted;
        bool isPaid;
        address contractor;
    }

    mapping(uint256 => Milestone) private milestones;
    uint256 public milestoneCount;
    address public owner;

    event MilestoneCreated(uint256 indexed id, address indexed contractor);
    event MilestoneApproved(uint256 indexed id);
    event FundsReleased(uint256 indexed id, address contractor);

    modifier onlyOwner() {
        require(msg.sender == owner, "Bukan pemilik");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // Membuat Milestone baru dengan data terenkripsi dari Frontend
    function createMilestone(
        address _contractor,
        inEuint32 calldata _budget,
        inEuint8 calldata _targetScore
    ) external onlyOwner {
        milestones[milestoneCount] = Milestone({
            encryptedBudget: FHE.asEuint32(_budget),
            encryptedTargetScore: FHE.asEuint8(_targetScore),
            isCompleted: false,
            isPaid: false,
            contractor: _contractor
        });

        emit MilestoneCreated(milestoneCount, _contractor);
        milestoneCount++;
    }

    // Evaluasi performa kontraktor secara rahasia di dalam FHE
    function verifyAndRelease(uint256 _id, inEuint8 calldata _actualScore) external onlyOwner {
        Milestone storage ms = milestones[_id];
        require(!ms.isCompleted, "Sudah selesai");

        euint8 actual = FHE.asEuint8(_actualScore);
        
        // Logika FHE: Apakah nilai aktual >= target? (Hasilnya encrypted boolean)
        ebool isPassed = FHE.gte(actual, ms.encryptedTargetScore);

        // Decrypt internal hanya untuk eksekusi logika rilis dana otomatis
        if (FHE.decrypt(isPassed)) {
            ms.isCompleted = true;
            ms.isPaid = true;
            emit MilestoneApproved(_id);
            emit FundsReleased(_id, ms.contractor);
            // Catatan: Di produksi, di sini fungsi Privara SDK dipicu untuk transfer token privat
        }
    }
}