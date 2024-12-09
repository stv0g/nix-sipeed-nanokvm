{
  stdenv,
  lib,
  fetchFromGitHub,
  git,
}:
stdenv.mkDerivation {
  name = "nanokvm";
  src = fetchFromGitHub {
    owner = "scpcom";
    repo = "LicheeSG-Nano-Build";
    rev = "f5b4eec092fb2d3c385f8ca00e4b71bfe4d9a6c8";
    hash = lib.fakeHash;
    leaveDotGit = true;
    fetchSubmodules = true;
  };

  buildInputs = [
    git
  ];

  buildPhase = ''
    ./build-nanokvm.sh
  '';
}
