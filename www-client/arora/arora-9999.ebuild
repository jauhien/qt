# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit qt4-edge git

DESCRIPTION="A cross-platform Qt4 WebKit browser"
HOMEPAGE="http://arora.googlecode.com/"
EGIT_REPO_URI="git://github.com/Arora/arora.git"

LICENSE="|| ( GPL-3 GPL-2 )"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND="x11-libs/qt-webkit:4"
DEPEND="${RDEPEND}"

src_configure() {
	eqmake4 arora.pro PREFIX="/usr"
}

src_compile() {
	emake || die "emake failed"
	# don't pre-strip
	sed -i "/strip/d" src/Makefile || die 'sed failed'
}

src_install() {
	emake INSTALL_ROOT="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog README
}
