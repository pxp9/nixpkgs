{
  lib,
  stdenv,
  fetchurl,
}:

stdenv.mkDerivation rec {
  version = "1.4.1";
  pname = "commons-daemon";

  src = fetchurl {
    url = "mirror://apache/commons/daemon/binaries/commons-daemon-${version}-bin.tar.gz";
    sha256 = "sha256-pfKrZ3duDz5wKTn3+SM+ye3UNN129VWCPOeI7JSuYts=";
  };

  installPhase = ''
    tar xf ${src}
    mkdir -p $out/share/java
    cp *.jar $out/share/java/
  '';

  meta = {
    homepage = "https://commons.apache.org/proper/commons-daemon";
    description = "Apache Commons Daemon software is a set of utilities and Java support classes for running Java applications as server processes";
    maintainers = with lib.maintainers; [ rsynnest ];
    sourceProvenance = with lib.sourceTypes; [ binaryBytecode ];
    license = lib.licenses.asl20;
    platforms = with lib.platforms; unix;
  };
}
