EAPI=4
inherit eutils toolchain-funcs

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
    x11-libs/libX11
    x11-libs/libXScrnSaver
    "
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_prepare() {
    cp "${FILESDIR}/idletime.c" "${WORKDIR}"
}

src_compile() {
    local my_compile="$(tc-getCC) ${CFLAGS} ${LDFLAGS} -o ${PN}{,.c} -lX11 -lXext -lXss"
    echo ${my_compile}
    eval ${my_compile} || die
}

src_install() {
    dobin ${PN}
}
