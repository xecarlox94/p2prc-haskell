{ mkDerivation, aeson, base, bytestring, directory, fetchgit, lib
, process, text
}:
mkDerivation {
  pname = "p2prc";
  version = "0.1.0.0";
  src = fetchgit {
    url = "https://github.com/xecarlox94/p2prc-haskell";
    sha256 = "1l2y0b5zrxn00gf46lz6d3h85dimmn9rhnmr8ya2b64mf3vdvaqj";
    rev = "1fc3f2d392465b6c2a48598aa056b35b2ca1df41";
    fetchSubmodules = true;
  };
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson base bytestring directory process text
  ];
  executableHaskellDepends = [ base ];
  description = "P2PRC haskell library";
  license = "unknown";
  mainProgram = "p2prc";
}
