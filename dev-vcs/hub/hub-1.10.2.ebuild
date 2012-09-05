EAPI="2"

GITHUB_USER="defunkt"
GITHUB_HASH="4479a20143d650ffaa2a7ac3075f5993fd9d4481"
GITHUB_REPO="hub"
MY_P="${GITHUB_USER}-${GITHUB_REPO}-${GITHUB_HASH:0:7}"

inherit eutils

DESCRIPTION="Command-line wrapper for Git that makes you better at GitHub"
HOMEPAGE="http://defunkt.io/hub/"
SRC_URI="https://github.com/${GITHUB_USER}/${GITHUB_REPO}/tarball/${GITHUB_HASH} -> ${MY_P}.tar.gz"

S="${WORKDIR}/${MY_P}"
LICENSE=""
SLOT="0"

KEYWORDS="x86 amd64"

IUSE=""

RDEPEND="dev-vcs/git"

src_install() {
    exeinto /usr/bin
    newexe standalone hub
}
