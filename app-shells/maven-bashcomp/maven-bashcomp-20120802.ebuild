EAPI="2"

GITHUB_USER="Godin"
GITHUB_HASH="09bffd7074b7b30281864a906e4e07727ef4d4f8"
GITHUB_REPO="maven-bash-completion"
MY_P="${GITHUB_USER}-${GITHUB_REPO}-${GITHUB_HASH:0:7}"

inherit eutils

DESCRIPTION="Maven bash command-line completions"
HOMEPAGE="http://maven.apache.org/"
SRC_URI="https://github.com/${GITHUB_USER}/${GITHUB_REPO}/tarball/${GITHUB_HASH} -> ${MY_P}.tar.gz"

S="${WORKDIR}/${MY_P}"
LICENSE=""
SLOT="0"

KEYWORDS="x86 amd64"

IUSE=""

RDEPEND="app-shells/bash-completion
         dev-java/maven-bin"

src_prepare() {
    cat - >> bash_completion.bash <<EOF

complete -o default -F _mvn -o nospace mvn-3.0
complete -o default -F _mvn -o nospace mvn-2.2
complete -o default -F _mvn -o nospace mvn-2.1
complete -o default -F _mvn -o nospace mvn-2.0
EOF
}

src_install() {
    insinto /usr/share/bash-completion
    newins bash_completion.bash maven
}

pkg_postinst() {
    # can't use bash-completion.eclass
    elog
    elog "To enable command-line completion for maven on a per-user basis run:"
    elog "  eselect bashcomp enable maven"
    elog
    elog "To enable command-line completion system-wide run:"
    elog "  eselect bashcomp enable --global maven"
    elog
}
