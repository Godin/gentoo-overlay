EAPI="2"

GITHUB_USER="defunkt"
GITHUB_HASH="4479a20143d650ffaa2a7ac3075f5993fd9d4481"
GITHUB_REPO="hub"
MY_P="${GITHUB_USER}-${GITHUB_REPO}-${GITHUB_HASH:0:7}"

inherit eutils bash-completion-r1

DESCRIPTION="Command-line wrapper for Git that makes you better at GitHub"
HOMEPAGE="http://defunkt.io/hub/"
SRC_URI="https://github.com/${GITHUB_USER}/${GITHUB_REPO}/tarball/${GITHUB_HASH} -> ${MY_P}.tar.gz
    bash-completion? ( https://github.com/${GITHUB_USER}/${GITHUB_REPO}/raw/v${PV}/etc/${GITHUB_REPO}.bash_completion.sh -> ${MY_P}.bash_completion )
    zsh-completion? ( https://github.com/${GITHUB_USER}/${GITHUB_REPO}/raw/v${PV}/etc/${GITHUB_REPO}.zsh_completion -> ${MY_P}.zsh_completion )"
S="${WORKDIR}/${MY_P}"
LICENSE=""
SLOT="0"

KEYWORDS="x86 amd64"

IUSE="bash-completion zsh-completion"

RDEPEND="dev-vcs/git
    zsh-completion? ( app-shells/zsh )"

src_install() {
    exeinto /usr/bin
    newexe standalone hub
    insinto etc/profile.d
    newins ${FILESDIR}/hub.sh hub.sh
    if use bash-completion ; then
        newbashcomp ${DISTDIR}/${MY_P}.bash_completion hub
    fi
    if use zsh-completion ; then
        insinto /usr/share/zsh/site-functions
        newins ${DISTDIR}/${MY_P}.zsh_completion _hub
    fi
}
