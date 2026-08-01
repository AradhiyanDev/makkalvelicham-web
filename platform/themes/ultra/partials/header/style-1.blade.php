<header class="main-header header-style-1">
    @if (theme_option('logo'))
        <div class="header-logo background-white text-center pt-20 pb-20 d-none d-lg-block">
            <div class="container">
                <div class="row align-items-center mb-3">
                    <div class="col-lg-4 text-left">
                        @if (is_plugin_active('language'))
                            <div class="language d-inline-block font-small mb-1">
                                {!! Theme::partial('language-switcher', ['color' => '']) !!}
                            </div>
                        @endif
                        <div class="font-small d-inline-block ml-2">
                            <i class="ti-calendar mr-1"></i>{{ date(theme_option('post_date_format', 'D, M Y')) }}
                        </div>
                    </div>

                    <div class="col-lg-4 text-center">
                        <a href="{{ route('public.index') }}">
                            <img class="img-logo d-inline img-fluid"
                                 src="{{ RvMedia::getImageUrl(theme_option('logo')) }}"
                                 alt="{{ setting('site_title') }}"
                                 style="max-height: 80px; width: auto;">
                        </a>
                    </div>

                    <div class="col-lg-4 text-right">
                        @if (theme_option('allow_account_login', '') == 'yes')
                            @if (!auth('member')->check())
                                <a href="{{ route('public.member.login') }}" class="btn btn-fill-out btn-sm ml-2" title="{{ __('Login') }}"
                                   style="display: inline-flex; align-items: center; justify-content: center; min-width: 110px; height: 40px; padding: 0 14px; font-size: 14px; border-radius: 10px;">
                                    <i class="ti-user mr-2"></i>{{ __('Login') }}
                                </a>
                            @else
                                <a href="{{ route('public.member.dashboard') }}" class="btn btn-fill-out btn-sm ml-2" title="{{ __('Account') }}"
                                   style="display: inline-flex; align-items: center; justify-content: center; min-width: 110px; height: 40px; padding: 0 14px; font-size: 14px; border-radius: 10px;">
                                    <i class="ti-user mr-2"></i>{{ __('Account') }}
                                </a>
                            @endif
                        @endif
                    </div>
                </div>
            </div>
        </div>
    @endif

    <div class="header-bottom header-sticky background-white text-center">
        <div class="mobile_menu d-lg-none d-block"></div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    {!! Theme::partial('header.offcanvas-sidebar') !!}
                    {!! Theme::partial('header.logo-tablet') !!}
                    {!! Theme::partial('header.logo-mobile') !!}

                    <div class="main-nav text-center d-none d-lg-block">
                        <nav>
                            {!! Menu::renderMenuLocation('main-menu', [
                                'view'    => 'menu',
                                'options' => ['id' => 'navigation', 'class' => 'main-menu', 'is-main-menu' => true],
                            ]) !!}
                        </nav>
                    </div>

                    {!! Theme::partial('header.search-button') !!}
                </div>
            </div>
        </div>
    </div>

    @if (Theme::has('afterHeader'))
        {!! Theme::get('afterHeader') !!}
    @endif
</header>
