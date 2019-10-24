# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Hacking Networked Solutions library for Bash"
HOMEPAGE="https://github.com/MADhacking/hacking-bash-lib"
LICENSE="LGPL-3"

if [[ ${PV} = *9999* ]]; then
    inherit git-r3
    EGIT_REPO_URI="https://github.com/MADhacking/hacking-bash-lib"
    EGIT_BRANCH="master"
else
    SRC_URI="https://github.com/MADhacking/hacking-bash-lib/archive/${P}.tar.bz2"
fi

KEYWORDS="amd64 x86"
IUSE="test"
SLOT="0"

RESTRICT="!test? ( test )"

DEPEND="test? ( dev-util/bats-assert )"

src_test() {
    bats --tap tests || die "Tests failed"
}

src_install() {
    einstalldocs

    insinto /usr/lib
    doins usr/lib/*
}
