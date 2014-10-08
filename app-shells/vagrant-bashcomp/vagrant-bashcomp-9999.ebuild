EAPI=5

inherit git-2 bash-completion-r1

DESCRIPTION="Vagrant bash command-line completions"
HOMEPAGE="https://github.com/kura/vagrant-bash-completion"

EGIT_REPO_URI="git://github.com/Tatsh/vagrant-bash-completion.git"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
    app-emulation/vagrant
"
DEPEND="${RDEPEND}"

src_compile() {
    // nothing to compile
}

src_install() {
    newbashcomp etc/bash_completion.d/vagrant vagrant
}
