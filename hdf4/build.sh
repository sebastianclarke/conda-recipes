#!/bin/bash

mkdir -vp ${PREFIX}/bin;

ARCH="$(uname 2>/dev/null)"

export CFLAGS="-pipe -O2 -fPIC -I${PREFIX}/include"
export CXXFLAGS="${CFLAGS}"
#export CPPFLAGS="-I${PREFIX}/include"

if [ `uname` == Darwin ]; then
    export DYLD_FALLBACK_LIBRARY_PATH=$PREFIX/lib
    export LDFLAGS="-L${PREFIX}/lib"
else
    export LD_LIBRARY_PATH=$PREFIX/lib
    export LDFLAGS="-L${PREFIX}/lib"
fi

LinuxInstallation() {

    chmod +x configure;

    ./configure \
        --disable-static \
        --enable-linux-lfs \
        --with-ssl \
        --with-zlib \
        --disable-netcdf \
        --disable-fortran \
        --prefix=${PREFIX} || return 1;
    make || return 1;
    make install || return 1;

    rm -rf ${PREFIX}/share/hdf4_examples;

    return 0;
}

MacOSXInstallation() {
	
	export CC=clang
	export CXX=clang++
	
    chmod +x configure;

    ./configure \
        --disable-static \
        --with-ssl \
        --with-zlib \
        --with-jpeg \
        --disable-netcdf \
        --disable-fortran \
        --prefix=${PREFIX} || return 1;
    make || return 1;
    make install || return 1;

    rm -rf ${PREFIX}/share/hdf4_examples;

    return 0;
}

case ${ARCH} in
    'Linux')
        LinuxInstallation || exit 1;
        ;;
    'Darwin')
        MacOSXInstallation || exit 1;
        ;;
    *)
        echo -e "Unsupported machine type: ${ARCH}";
        exit 1;
        ;;
esac

#POST_LINK="${PREFIX}/bin/.hdf4-post-link.sh"
#cp -v ${RECIPE_DIR}/post-link.sh ${POST_LINK};
#chmod -v 0755 ${POST_LINK};
