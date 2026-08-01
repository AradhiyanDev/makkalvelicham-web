<div class="form-group mb-3">
    <label class="control-label">{{ __('Title') }}</label>
    <input type="text" name="title" value="{{ Arr::get($attributes, 'title') }}" class="form-control"/>
</div>

<div class="form-group mb-3">
    <label class="control-label">{{ __('Description') }}</label>
    <textarea name="description" class="form-control">{{ Arr::get($attributes, 'description') }}</textarea>
</div>

<div class="form-group mb-3">
    <label class="control-label">{{ __('Filter By') }}</label>
    <select name="filter_by" class="form-control" id="filterBy">
        <option value="featured" @if (Arr::get($attributes, 'filter_by') == 'featured') selected @endif>
            {{ __('Featured Posts') }}
        </option>
        <option value="recent" @if (Arr::get($attributes, 'filter_by') == 'recent') selected @endif>
            {{ __('Recent Posts') }}
        </option>
        <option value="ids" @if (Arr::get($attributes, 'filter_by') == 'ids') selected @endif>
            {{ __('Post Ids') }}
        </option>

    </select>
</div>

<div class="tab-filter tab-featured tab-recent">
    <div class="form-group mb-3">
        <label class="control-label">{{ __('Limit') }}</label>
        <input type="number" name="limit" value="{{ Arr::get($attributes, 'limit', 4) }}" class="form-control"/>
    </div>
</div>

<div class="tab-filter tab-ids">
    <div class="form-group mb-3">
        <label class="control-label">{{ __('Post Ids') }}</label>
        <input name="include" value="{{ Arr::get($attributes, 'include') }}" class="form-control" placeholder="1,2,3">
    </div>
</div>



<div class="form-group mb-3">
    <label class="control-label">{{ __('Style') }}</label>
    <select name="style" class="form-control">
        <option value="1" @if (Arr::get($attributes, 'style') == 1) selected @endif>{{ __('Style 1') }}</option>
        <option value="2" @if (Arr::get($attributes, 'style') == 2) selected @endif>{{ __('Style 2') }}</option>
        <option value="3" @if (Arr::get($attributes, 'style') == 3) selected @endif>{{ __('Style 3') }}</option>
    </select>
</div>

<script>
    'use strict';
    var filterByValue = $('#filterBy option').filter(':selected').val();
    $('#filterBy').on('change', function () {
        triggerTab($(this).val());
    });

    function triggerTab(tabName) {
        var $container = $('#filterBy').closest('.shortcode-admin-config');

        // Hide all tabs and store original names
        $container.find('.tab-filter').each(function() {
            $(this).hide();
            $(this).find('input, select').each(function() {
                if (!$(this).data('original-name')) {
                    $(this).data('original-name', $(this).attr('name'));
                }
                $(this).removeAttr('name'); // Remove name so it won't be submitted
            });
        });

        // Show active tab and restore names
        $container.find('.tab-' + tabName).show();
        $container.find('.tab-' + tabName).find('input, select').each(function() {
            var originalName = $(this).data('original-name');
            if (originalName) {
                $(this).attr('name', originalName);
            }
        });
    }

    triggerTab(filterByValue);
</script>
