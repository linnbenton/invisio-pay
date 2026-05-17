module.exports = async ({ getNamedAccounts, deployments }) => {
  const { deploy } = deployments;
  const { deployer } = await getNamedAccounts();

  console.log("🚀 Memulai deployment InvisioPay dengan akun:", deployer);

  const invisioPay = await deploy("InvisioPay", {
    from: deployer,
    args: [], // Kontrak kita tidak butuh argumen constructor
    log: true,
    skipIfAlreadyDeployed: false,
  });

  console.log("✅ InvisioPay BERHASIL DIDEPLOY!");
  console.log("📍 Alamat Kontrak:", invisioPay.address);
};

module.exports.tags = ["InvisioPay"];
