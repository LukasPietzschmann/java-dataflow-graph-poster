"""
    pygments.styles.stata_light
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~

    Light Style inspired by Stata's do-file editor. Note this is not
    meant to be a complete style, just for Stata's file formats.

    :copyright: Copyright 2006-2023 by the Pygments team, see AUTHORS.
    :license: BSD, see LICENSE for details.
"""

from pygments.style import Style
from pygments.token import Keyword, Name, Comment, String, Error, \
    Number, Operator, Whitespace, Text


class StataLightStyle(Style):
    """
    Light mode style inspired by Stata's do-file editor. This is not
    meant to be a complete style, just for use with Stata.
    """

    styles = {
        Text:                  '#111111',
        Whitespace:            '#bbbbbb',
        Error:                 'bg:#e3d2d2 #a61717',
        String:                '#a51d2d',
        Number:                '#a51d2d',
        Operator:              '#77767b',
        Name.Function:         '#1a5fb4',
        Name.Other:            '#be646c',
        Keyword:               'bold #49283d',
        Keyword.Constant:      '',
        Comment:               'italic #008800',
        Name.Variable:         'bold #35baba',
        Name.Variable.Global:  'bold #b5565e',
    }
