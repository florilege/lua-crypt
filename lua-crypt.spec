Name: lua-crypt
Summary: Provides a crypt() function for the Lua programing language
Summary(pt_BR): Fornece uma função crypt() para a linguagem de programação Lua
Packager: Alexandre Erwin Ittner <aittner@netuno.com.br>
Version: 1.0
Release: 1
License: MIT
Group: Libraries
Group(pt_BR): Bibliotecas
Source0: %{name}-%{version}.tar.gz
URL: http://users.netuno.com.br/aittner/
BuildRoot: %{_tmppath}/%{name}-%{version}-root
Requires: lua
BuildRequires: lua-devel
Prefix: /usr
Provides: libluacrypt.so luacrypt

%description
luacrypt is a C library that binds the crypt() function from POSIX
operating systems to the standard Lua 5.0 interpreter.  It is copyright
Alexandre Erwin Ittner 2004, and is released under the MIT license,
like Lua (see http://www.lua.org/copyright.html for the full license;
it's basically the same as the BSD license). There is no warranty.


%description -l pt_BR
luacrypt é uma biblioteca C que liga a função crypt() dos sistemas
operacionais POSIX ao interpretador Lua 5.0 padrão. Seu copyright pertence
a Alexandre Erwin Ittner e, assim como Lua, distribuída sob a licença
MIT (veja http://www.lua.org/copyright.html para a licença completa;
é basicamente uma licença BSD). Não há garantia.


%prep
%setup -q

%build
make

%install
mkdir -p $RPM_BUILD_ROOT%{_libdir}
cp *.so $RPM_BUILD_ROOT%{_libdir}

%clean
rm -rf %{buildroot} $RPM_BUILD_ROOT $RPM_BUILD_DIR/%{name}-%{version}

%post
/sbin/ldconfig

%postun
/sbin/ldconfig

%files
%defattr(-,root,root)
%doc README crypt.lua
%{_libdir}/*.so*

%changelog
* Sat Dec 04 2004 Alexandre Erwin Ittner <aittner@netuno.com.br>
- First version of this package

