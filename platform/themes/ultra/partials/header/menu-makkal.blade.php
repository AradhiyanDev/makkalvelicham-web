<ul {!! $options !!}>
    @foreach ($menu_nodes as $row)
        <li class="mv-nav-item @if ($row->has_child) has-child @endif @if ($row->active) current @endif">
            <a href="{{ url($row->url) }}" @if ($row->target !== '_self') target="{{ $row->target }}" @endif>
                @if ($row->icon_font) <i class="{{ trim($row->icon_font) }}"></i> @endif {{ $row->title }}
            </a>
            @if ($row->has_child)
                {!! Menu::generateMenu([
                    'menu'       => $menu,
                    'menu_nodes' => $row->child,
                    'view'       => 'header.menu-makkal',
                    'options'    => ['class' => 'mv-sub-menu'],
                ]) !!}
            @endif
        </li>
    @endforeach
</ul>
