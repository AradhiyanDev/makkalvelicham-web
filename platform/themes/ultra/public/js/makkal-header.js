"use strict";

(function () {
    var header = document.getElementById('mvHeader');

    if (! header) {
        return;
    }

    var mobileQuery = window.matchMedia('(max-width: 767px)');
    var drawer = document.getElementById('mvDrawer');
    var backdrop = document.getElementById('mvBackdrop');
    var hamburger = document.getElementById('mvHamburger');
    var drawerClose = document.getElementById('mvDrawerClose');
    var langToggle = document.querySelector('.mv-lang-toggle');
    var langWrap = document.getElementById('mvLang');
    var searchToggles = document.querySelectorAll('.mv-search-toggle');
    var searchWrap = document.getElementById('mvSearch');
    var mobileSearch = document.getElementById('mvMobileSearch');
    var scrollBar = document.getElementById('mvScrollBar');

    var lastY = window.scrollY || 0;
    var ticking = false;
    var menuOpen = false;

    function setMenuOpen(open) {
        menuOpen = open;
        header.classList.toggle('mv-menu-open', open);
        hamburger.setAttribute('aria-expanded', open ? 'true' : 'false');

        if (drawer) {
            drawer.classList.toggle('is-open', open);
            drawer.setAttribute('aria-hidden', open ? 'false' : 'true');
        }

        if (backdrop) {
            backdrop.classList.toggle('is-open', open);
        }

        document.body.classList.toggle('mv-no-scroll', open);
    }

    function closeSearch() {
        if (searchWrap) {
            searchWrap.classList.remove('is-open');
        }

        if (mobileSearch) {
            mobileSearch.classList.remove('is-open');
        }

        searchToggles.forEach(function (toggle) {
            toggle.setAttribute('aria-expanded', 'false');
        });
    }

    function onScrollUpdate() {
        ticking = false;

        var y = window.scrollY || 0;

        if (scrollBar) {
            var max = document.documentElement.scrollHeight - window.innerHeight;
            var progress = max > 0 ? (y / max) * 100 : 0;
            scrollBar.style.width = progress + '%';
        }

        header.classList.toggle('mv-scrolled', y > 5);

        if (y > 80) {
            if (y > lastY + 4) {
                header.classList.remove('is-scrolling-up');
                header.classList.add('is-scrolling-down');
            } else if (y < lastY - 4) {
                header.classList.remove('is-scrolling-down');
                header.classList.add('is-scrolling-up');
            }
        } else {
            header.classList.remove('is-scrolling-down', 'is-scrolling-up');
        }

        lastY = y;
    }

    function onScroll() {
        if (! ticking) {
            window.requestAnimationFrame(onScrollUpdate);
            ticking = true;
        }
    }

    window.addEventListener('scroll', onScroll, { passive: true });
    onScrollUpdate();

    if (hamburger) {
        hamburger.addEventListener('click', function () {
            setMenuOpen(! menuOpen);
        });
    }

    if (drawerClose) {
        drawerClose.addEventListener('click', function () {
            setMenuOpen(false);
        });
    }

    if (backdrop) {
        backdrop.addEventListener('click', function () {
            setMenuOpen(false);
        });
    }

    document.addEventListener('keydown', function (event) {
        if (event.key === 'Escape') {
            if (menuOpen) {
                setMenuOpen(false);
            }

            closeSearch();
        }
    });

    if (langWrap && langToggle) {
        langToggle.addEventListener('click', function (event) {
            event.preventDefault();
            event.stopPropagation();
            langWrap.classList.toggle('is-open');
            langToggle.setAttribute('aria-expanded', langWrap.classList.contains('is-open') ? 'true' : 'false');
        });

        document.addEventListener('click', function (event) {
            if (! langWrap.contains(event.target)) {
                langWrap.classList.remove('is-open');
                langToggle.setAttribute('aria-expanded', 'false');
            }
        });
    }

    function openSearch(input) {
        closeSearch();
        input.focus();
    }

    searchToggles.forEach(function (toggle) {
        toggle.addEventListener('click', function (event) {
            event.preventDefault();
            var isExpanded = toggle.getAttribute('aria-expanded') === 'true';

            if (mobileQuery.matches) {
                if (isExpanded) {
                    closeSearch();
                } else {
                    toggle.setAttribute('aria-expanded', 'true');
                    mobileSearch.classList.add('is-open');
                    var input = mobileSearch.querySelector('.mv-search-input');
                    if (input) {
                        input.focus();
                    }
                }

                return;
            }

            if (isExpanded) {
                closeSearch();
            } else {
                toggle.setAttribute('aria-expanded', 'true');
                searchWrap.classList.add('is-open');
                var input = searchWrap.querySelector('.mv-search-input');
                if (input) {
                    input.focus();
                }
            }
        });
    });

    document.addEventListener('click', function (event) {
        if (event.target.closest('.mv-search-toggle')) {
            return;
        }

        if (searchWrap && searchWrap.classList.contains('is-open') && ! searchWrap.contains(event.target)) {
            closeSearch();
        }

        if (mobileSearch && mobileSearch.classList.contains('is-open') && ! mobileSearch.contains(event.target)) {
            closeSearch();
        }
    });

    searchToggles.forEach(function (toggle) {
        var form = toggle.closest('.mv-search');
        if (form) {
            var input = form.querySelector('.mv-search-input');
            if (input) {
                input.addEventListener('keydown', function (event) {
                    if (event.key === 'Escape') {
                        event.preventDefault();
                        closeSearch();
                    }
                });
            }
        }
    });
})();
