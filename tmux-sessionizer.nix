{ pkgs, lib, stdenv }: stdenv.mkDerivation rec {
  pname = "tmux-sessionizer";
  version = "1.0";

  src = ./.;

  nativeBuildInputs = with pkgs; [ fzf tmux ];
  buildInputs = with pkgs; [ makeWrapper ];

  installPhase = ''
    mkdir -p "$out/bin"
    cp ${pname} $out/bin/${pname}
    wrapProgram $out/bin/${pname} \
      --prefix PATH : ${lib.makeBinPath nativeBuildInputs}
  '';

  meta = with lib; {
    homepage = "https://github.com/nativerv/tmux-sessionizer";
    # FIXME: actual description
    description = "Tmux sessionizer";
    platforms = platforms.unix;
    license = licenses.gpl3;
    mainProgram = "tmux-sessionizer";
  };
}

