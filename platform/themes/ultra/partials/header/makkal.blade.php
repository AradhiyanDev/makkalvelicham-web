<header class="mv-header" id="mvHeader">
    <div class="mv-utility" id="mvUtility">
        <div class="mv-container">
            <div class="mv-utility-grid">
                <div class="mv-utility-left">
                    <span class="mv-date">{{ now()->translatedFormat('D, M j') }}</span>
                    <span class="mv-divider" aria-hidden="true"></span>
                    <span class="mv-weather">
                        <i class="ti ti-sun mv-weather-icon"></i>
                        <span class="mv-weather-city">{{ theme_option('weather_city', 'Chennai') }}</span>
                        <b class="mv-weather-temp">{{ theme_option('weather_temp', '35°') }}</b>
                    </span>
                </div>

                <div class="mv-logo mv-logo-main">
                    <a href="{{ route('public.index') }}" aria-label="{{ theme_option('site_title', setting('site_title')) }}">
                        <img src="{{ RvMedia::getImageUrl(theme_option('logo')) }}" alt="{{ theme_option('site_title', setting('site_title')) }}">
                    </a>
                </div>

                <div class="mv-utility-right">
                    @if (theme_option('allow_account_login', '') == 'yes')
                        @if (! auth('member')->check())
                            <a class="mv-login-btn" href="{{ route('public.member.login') }}">
                                <i class="ti-user"></i><span>{{ __('Login') }}</span>
                            </a>
                        @else
                            <a class="mv-login-btn mv-login-btn-filled" href="{{ route('public.member.dashboard') }}">
                                <i class="ti-user"></i><span>{{ __('Account') }}</span>
                            </a>
                        @endif
                    @endif

                    <a class="mv-icon-btn" href="{{ auth('member')->check() ? route('public.member.dashboard') : route('public.member.login') }}"
                       aria-label="{{ __('Notifications') }}" title="{{ __('Notifications') }}">
                        <i class="ti-bell"></i>
                    </a>

                    @if (is_plugin_active('language') && count(Language::getSupportedLocales()) > 1)
                        <div class="mv-lang" id="mvLang">
                            <button class="mv-icon-btn mv-lang-toggle" type="button" aria-label="{{ __('Language') }}"
                                    aria-haspopup="true" aria-expanded="false">
                                <i class="ti-world"></i>
                                <span class="mv-lang-name">{{ Language::getCurrentLocaleName() }}</span>
                            </button>
                            <ul class="mv-lang-menu">
                                @foreach (Language::getSupportedLocales() as $localeCode => $properties)
                                    @if ($localeCode != Language::getCurrentLocale())
                                        <li>
                                            <a href="{{ Language::getSwitcherUrl($localeCode, $properties['lang_code']) }}">
                                                @if (($languageDisplay = setting('language_display', 'all')) == 'all' || $languageDisplay == 'flag')
                                                    {!! language_flag($properties['lang_flag'], $properties['lang_name']) !!}
                                                @endif
                                                <span>{{ $properties['lang_name'] }}</span>
                                            </a>
                                        </li>
                                    @endif
                                @endforeach
                            </ul>
                        </div>
                    @endif

                    <button class="mv-icon-btn mv-search-toggle" type="button" aria-label="{{ __('Search') }}" title="{{ __('Search') }}">
                        <i class="ti-search"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="mv-mobile-search" id="mvMobileSearch">
        <div class="mv-container">
            <form class="mv-search-form" action="{{ route('public.search') }}" method="GET" role="search">
                <input class="mv-search-input" type="search" name="q" placeholder="{{ __('Search News...') }}"
                       aria-label="{{ __('Search News') }}" autocomplete="off">
                <button class="mv-mobile-search-submit" type="submit" aria-label="{{ __('Search') }}">
                    <i class="ti-search"></i>
                </button>
            </form>
        </div>
    </div>

    <div class="mv-backdrop" id="mvBackdrop"></div>

    <aside class="mv-drawer" id="mvDrawer" aria-label="{{ __('Menu') }}" aria-hidden="true">
        <div class="mv-drawer-head">
            <div class="mv-logo mv-logo-drawer">
                <a href="{{ route('public.index') }}" aria-label="{{ theme_option('site_title', setting('site_title')) }}">
                    <img src="{{ RvMedia::getImageUrl(theme_option('logo')) }}" alt="{{ theme_option('site_title', setting('site_title')) }}">
                </a>
            </div>
            <button class="mv-drawer-close" id="mvDrawerClose" type="button" aria-label="{{ __('Close') }}">
                <i class="ti-close"></i>
            </button>
        </div>

        <div class="mv-drawer-search">
            <form class="mv-search-form" action="{{ route('public.search') }}" method="GET" role="search">
                <i class="ti-search"></i>
                <input class="mv-search-input" type="search" name="q" placeholder="{{ __('Search News...') }}"
                       aria-label="{{ __('Search News') }}" autocomplete="off">
            </form>
        </div>

        <div class="mv-drawer-body">
            <ul class="mv-drawer-list">
                <li><a class="mv-drawer-link" href="{{ route('public.index') }}">{{ __('Home') }}</a></li>
                <li><a class="mv-drawer-link" href="{{ route('public.index') }}">{{ __('Latest News') }}</a></li>
                {!! Menu::renderMenuLocation('main-menu', [
                    'view'    => 'header.menu-makkal',
                    'options' => ['class' => 'mv-drawer-menu', 'is-main-menu' => true],
                ]) !!}
                <li><a class="mv-drawer-link" href="{{ route('public.single', ['slug' => 'about-us']) }}">{{ __('About') }}</a></li>
                <li><a class="mv-drawer-link" href="{{ route('public.single', ['slug' => 'contact']) }}">{{ __('Contact') }}</li>
            </ul>

            <div class="mv-drawer-foot">
                @if (theme_option('allow_account_login', '') == 'yes')
                    @if (! auth('member')->check())
                        <a class="mv-drawer-login" href="{{ route('public.member.login') }}">
                            <i class="ti-user"></i>{{ __('Login') }}
                        </a>
                    @else
                        <a class="mv-drawer-login" href="{{ route('public.member.dashboard') }}">
                            <i class="ti-user"></i>{{ __('Account') }}
                        </a>
                    @endif
                @endif

                @if (is_plugin_active('language') && count(Language::getSupportedLocales()) > 1)
                    <div class="mv-drawer-langs">
                        @foreach (Language::getSupportedLocales() as $localeCode => $properties)
                            @if ($localeCode != Language::getCurrentLocale())
                                <a href="{{ Language::getSwitcherUrl($localeCode, $properties['lang_code']) }}">
                                    @if (($languageDisplay = setting('language_display', 'all')) == 'all' || $languageDisplay == 'flag')
                                        {!! language_flag($properties['lang_flag'], $properties['lang_name']) !!}
                                    @endif
                                    <span>{{ $properties['lang_name'] }}</span>
                                </a>
                            @endif
                        @endforeach
                    </div>
                @endif

                @if (! empty(theme_option('social_links')))
                    <div class="mv-drawer-socials">
                        @foreach (json_decode(theme_option('social_links'), true) as $socialLink)
                            <a href="{{ $socialLink[2]['value'] }}" target="_blank" rel="noopener"
                               class="social-icon {{ strtolower($socialLink[1]['value']) }}-icon"
                               title="{{ $socialLink[0]['value'] }}">
                                <i class="ti-{{ strtolower($socialLink[1]['value']) }}"></i>
                            </a>
                        @endforeach
                    </div>
                @endif
            </div>
        </div>
    </aside>
</header>

<nav class="mv-nav" id="mvNav" aria-label="{{ __('Main navigation') }}">
    <div class="mv-container">
        <div class="mv-nav-grid">
            <div class="mv-nav-left">
                <button class="mv-hamburger" id="mvHamburger" type="button" aria-label="{{ __('Menu') }}"
                        aria-controls="mvDrawer" aria-expanded="false">
                    <span></span><span></span><span></span>
                </button>
            </div>

            <div class="mv-nav-center">
                <div class="mv-logo mv-logo-nav">
                    <a href="{{ route('public.index') }}" aria-label="{{ theme_option('site_title', setting('site_title')) }}">
                        <img src="{{ RvMedia::getImageUrl(theme_option('logo')) }}" alt="{{ theme_option('site_title', setting('site_title')) }}">
                    </a>
                </div>
                    <div class="mv-cats" aria-label="{{ __('Categories') }}">
                        {!! Menu::renderMenuLocation('main-menu', [
                            'view'    => 'header.menu-makkal',
                            'options' => ['id' => 'mvCategories', 'class' => 'mv-cats-list', 'is-main-menu' => true],
                        ]) !!}
                    </div>
            </div>

            <div class="mv-nav-right">
                <div class="mv-search" id="mvSearch">
                    <form class="mv-search-form" action="{{ route('public.search') }}" method="GET" role="search">
                        <input class="mv-search-input" type="search" name="q" placeholder="{{ __('Search News...') }}"
                               aria-label="{{ __('Search News') }}" autocomplete="off">
                    </form>
                    <button class="mv-icon-btn mv-search-toggle" type="button" aria-label="{{ __('Search') }}" title="{{ __('Search') }}">
                        <i class="ti-search"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</nav>
