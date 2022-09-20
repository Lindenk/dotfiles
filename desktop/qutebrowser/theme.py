import json
import os


def get_pallete():
    path = os.path.join(os.environ['HOME'], '.cache/wal/colors.json')
    with open(path) as f:
        all_colors = json.load(f)

    colors = all_colors["colors"]
    bg = all_colors["special"]['background']
    fg = all_colors["special"]['foreground']

    palette = {
        'background': bg,
        'background-alt': colors["color0"],
        'background-attention': colors["color12"],
        'border': colors["color8"],
        'current-line': colors["color7"],
        'selection': colors["color7"],
        'foreground': fg,
        'foreground-alt': colors["color15"],
        'foreground-attention': colors["color9"],
        'comment': colors["color14"],
        'cyan':   colors["color6"],
        'green':  colors["color2"],
        'orange': colors["color3"],
        'pink':   colors["color9"],
        'purple': colors["color5"],
        'lightpurple': colors["color13"],
        'red':    colors["color1"],
        'yellow': colors["color11"],
        'blue': colors["color4"],
        'lightblue': colors["color12"]
    }

    return palette


def apply_settings(c, options={}):
    palette = get_pallete()

    spacing = options.get('spacing', {
        'vertical': 0,
        'horizontal': 2
    })

    padding = options.get('padding', {
        'top': spacing['vertical'],
        'right': spacing['horizontal'],
        'bottom': spacing['vertical'],
        'left': spacing['horizontal']
    })

    # Background color of the completion widget category headers.
    c.colors.completion.category.bg = palette['background']

    # Bottom border color of the completion widget category headers.
    c.colors.completion.category.border.bottom = palette['border']

    # Top border color of the completion widget category headers.
    c.colors.completion.category.border.top = palette['border']

    # Foreground color of completion widget category headers.
    c.colors.completion.category.fg = palette['foreground']

    # Background color of the completion widget for even rows.
    c.colors.completion.even.bg = palette['background']

    # Background color of the completion widget for odd rows.
    c.colors.completion.odd.bg = palette['background-alt']

    # Text color of the completion widget.
    c.colors.completion.fg = palette['foreground']

    # Background color of the selected completion item.
    c.colors.completion.item.selected.bg = palette['selection']

    # Bottom border color of the selected completion item.
    c.colors.completion.item.selected.border.bottom = palette['selection']

    # Top border color of the completion widget category headers.
    c.colors.completion.item.selected.border.top = palette['selection']

    # Foreground color of the selected completion item.
    c.colors.completion.item.selected.fg = palette['foreground']

    # Foreground color of the matched text in the completion.
    c.colors.completion.match.fg = palette['orange']

    # Color of the scrollbar in completion view
    c.colors.completion.scrollbar.bg = palette['background']

    # Color of the scrollbar handle in completion view.
    c.colors.completion.scrollbar.fg = palette['foreground']

    # Background color for the download bar.
    c.colors.downloads.bar.bg = palette['background']

    # Background color for downloads with errors.
    c.colors.downloads.error.bg = palette['background']

    # Foreground color for downloads with errors.
    c.colors.downloads.error.fg = palette['red']

    # Color gradient stop for download backgrounds.
    c.colors.downloads.stop.bg = palette['background']

    # Color gradient interpolation system for download backgrounds.
    # Type: ColorSystem
    # Valid values:
    # - rgb: Interpolate in the RGB color system.
    # - hsv: Interpolate in the HSV color system.
    # - hsl: Interpolate in the HSL color system.
    # - none: Don't show a gradient.
    c.colors.downloads.system.bg = 'none'

    # Background color for hints. Note that you can use a `rgba(...)` value
    # for transparency.
    c.colors.hints.bg = palette['background']

    # Font color for hints.
    c.colors.hints.fg = palette['foreground']

    # Hints
    c.hints.border = '1px solid ' + palette['background-alt']

    # Font color for the matched part of hints.
    c.colors.hints.match.fg = palette['foreground-alt']

    # Background color of the keyhint widget.
    c.colors.keyhint.bg = palette['background']

    # Text color for the keyhint widget.
    c.colors.keyhint.fg = palette['foreground']

    # Highlight color for keys to complete the current keychain.
    c.colors.keyhint.suffix.fg = palette['selection']

    # Background color of an error message.
    c.colors.messages.error.bg = palette['background']

    # Border color of an error message.
    c.colors.messages.error.border = palette['background-alt']

    # Foreground color of an error message.
    c.colors.messages.error.fg = palette['red']

    # Background color of an info message.
    c.colors.messages.info.bg = palette['background']

    # Border color of an info message.
    c.colors.messages.info.border = palette['background-alt']

    # Foreground color an info message.
    c.colors.messages.info.fg = palette['comment']

    # Background color of a warning message.
    c.colors.messages.warning.bg = palette['background']

    # Border color of a warning message.
    c.colors.messages.warning.border = palette['background-alt']

    # Foreground color a warning message.
    c.colors.messages.warning.fg = palette['red']

    # Background color for prompts.
    c.colors.prompts.bg = palette['background']

    # ## Border used around UI elements in prompts.
    c.colors.prompts.border = '1px solid ' + palette['background-alt']

    # Foreground color for prompts.
    c.colors.prompts.fg = palette['cyan']

    # Background color for the selected item in filename prompts.
    c.colors.prompts.selected.bg = palette['selection']

    # Background color of the statusbar in caret mode.
    c.colors.statusbar.caret.bg = palette['background']

    # Foreground color of the statusbar in caret mode.
    c.colors.statusbar.caret.fg = palette['orange']

    # Background color of the statusbar in caret mode with a selection.
    c.colors.statusbar.caret.selection.bg = palette['background']

    # Foreground color of the statusbar in caret mode with a selection.
    c.colors.statusbar.caret.selection.fg = palette['orange']

    # Background color of the statusbar in command mode.
    c.colors.statusbar.command.bg = palette['background']

    # Foreground color of the statusbar in command mode.
    c.colors.statusbar.command.fg = palette['pink']

    # Background color of the statusbar in private browsing + command mode.
    c.colors.statusbar.command.private.bg = palette['background']

    # Foreground color of the statusbar in private browsing + command mode.
    c.colors.statusbar.command.private.fg = palette['foreground-alt']

    # Background color of the statusbar in insert mode.
    c.colors.statusbar.insert.bg = palette['background-attention']

    # Foreground color of the statusbar in insert mode.
    c.colors.statusbar.insert.fg = palette['foreground-attention']

    # Background color of the statusbar.
    c.colors.statusbar.normal.bg = palette['background']

    # Foreground color of the statusbar.
    c.colors.statusbar.normal.fg = palette['foreground']

    # Background color of the statusbar in passthrough mode.
    c.colors.statusbar.passthrough.bg = palette['background']

    # Foreground color of the statusbar in passthrough mode.
    c.colors.statusbar.passthrough.fg = palette['orange']

    # Background color of the statusbar in private browsing mode.
    c.colors.statusbar.private.bg = palette['background-alt']

    # Foreground color of the statusbar in private browsing mode.
    c.colors.statusbar.private.fg = palette['foreground-alt']

    # Background color of the progress bar.
    c.colors.statusbar.progress.bg = palette['background']

    # Foreground color of the URL in the statusbar on error.
    c.colors.statusbar.url.error.fg = palette['red']

    # Default foreground color of the URL in the statusbar.
    c.colors.statusbar.url.fg = palette['foreground']

    # Foreground color of the URL in the statusbar for hovered links.
    c.colors.statusbar.url.hover.fg = palette['cyan']

    # Foreground color of the URL in the statusbar on successful load
    c.colors.statusbar.url.success.http.fg = palette['lightblue']

    # Foreground color of the URL in the statusbar on successful load
    c.colors.statusbar.url.success.https.fg = palette['lightblue']

    # Foreground color of the URL in the statusbar when there's a warning.
    c.colors.statusbar.url.warn.fg = palette['yellow']

    # Status bar padding
    c.statusbar.padding = padding

    # Background color of the tab bar.
    # Type: QtColor
    c.colors.tabs.bar.bg = palette['background']

    # Background color of unselected even tabs.
    # Type: QtColor
    c.colors.tabs.even.bg = palette['background']

    # Foreground color of unselected even tabs.
    # Type: QtColor
    c.colors.tabs.even.fg = palette['foreground']

    # Color for the tab indicator on errors.
    # Type: QtColor
    c.colors.tabs.indicator.error = palette['red']

    # Color gradient start for the tab indicator.
    # Type: QtColor
    c.colors.tabs.indicator.start = palette['orange']

    # Color gradient end for the tab indicator.
    # Type: QtColor
    c.colors.tabs.indicator.stop = palette['purple']

    # Color gradient interpolation system for the tab indicator.
    # Type: ColorSystem
    # Valid values:
    # - rgb: Interpolate in the RGB color system.
    # - hsv: Interpolate in the HSV color system.
    # - hsl: Interpolate in the HSL color system.
    # - none: Don't show a gradient.
    c.colors.tabs.indicator.system = 'none'

    # Background color of unselected odd tabs.
    # Type: QtColor
    c.colors.tabs.odd.bg = palette['background']

    # Foreground color of unselected odd tabs.
    # Type: QtColor
    c.colors.tabs.odd.fg = palette['foreground']

    # ## Background color of selected even tabs.
    # ## Type: QtColor
    c.colors.tabs.selected.even.bg = palette['lightpurple']

    # ## Foreground color of selected even tabs.
    # ## Type: QtColor
    c.colors.tabs.selected.even.fg = palette['foreground']

    # ## Background color of selected odd tabs.
    # ## Type: QtColor
    c.colors.tabs.selected.odd.bg = palette['lightpurple']

    # ## Foreground color of selected odd tabs.
    # ## Type: QtColor
    c.colors.tabs.selected.odd.fg = palette['foreground']

    # Background color of pinned unselected even tabs.
    c.colors.tabs.pinned.even.bg = c.colors.tabs.even.bg

    # Foreground color of pinned unselected even tabs.
    c.colors.tabs.pinned.even.fg = c.colors.tabs.even.fg

    # Background color of pinned unselected odd tabs.
    c.colors.tabs.pinned.odd.bg = c.colors.tabs.odd.bg

    # Foreground color of pinned unselected odd tabs.
    c.colors.tabs.pinned.odd.fg = c.colors.tabs.odd.fg

    # Background color of pinned selected even tabs.
    c.colors.tabs.pinned.selected.even.bg = c.colors.tabs.selected.even.bg

    # Foreground color of pinned selected even tabs.
    c.colors.tabs.pinned.selected.even.fg = c.colors.tabs.selected.even.fg

    # Background color of pinned selected odd tabs.
    c.colors.tabs.pinned.selected.odd.bg = c.colors.tabs.selected.odd.bg

    # Foreground color of pinned selected odd tabs.
    c.colors.tabs.pinned.selected.odd.fg = c.colors.tabs.selected.odd.fg

    # Tab padding
    c.tabs.padding = padding
    c.tabs.indicator.width = 1
    c.tabs.favicons.scale = 1
