\version "2.22.1"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"Speak Low"
composer = #"Kurt Weill"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Swing"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  %asplayed = #"" % doit être commentée si vide
  url = #""
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    %voltaSpannerDuration = #(ly:make-moment 4 4)
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
    \override MultiMeasureRest #'expand-limit = #3
    %     \override NonMusicalPaperColumn #'line-break-permission = ##f
    %     \override NonMusicalPaperColumn #'page-break-permission = ##f
    % à remplacer par \autoLineBreaksOff et \autoBreaksOff
  }
  \context {
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  \context { \Score markFormatter = #format-mark-box-alphabet }
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}

\defineBarLine "||-[|:" #'("||" "[|:" "[|:")

form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  s4 \repeat unfold 2 { g1:m7 c:7  }  \repeat unfold 2 { g2:m7 c:7  } a1:m5-7 d:7
  \repeat unfold 2 { bes:m7 es:7 } a2:m7 d:7 g:m7 c:7 f:6 bes:7+ a:m7 d:7 f1:6 s
  f:m7 s des:5+7 des:7 es:7+ s des:7 c:7
  \repeat unfold 2 { g1:m7 c:7  } \repeat unfold 2 { g2:m7 c:7  } a1:m5-7 d:7
  bes:m7 es:7 a:m5-7 d:7 g:m7 c:7 f1:6
  \startParenthesis \parenthesize a2:m7 \endParenthesis \parenthesize d:7
}


theNotes =  \relative c' {
  \clef "treble" \key f \major \time 4/4
  \partial 4 c4
  \repeat volta 2 {
    \mark #1 \repeat unfold 2 { a'1~ | a2 \tuplet 3/2 { g4 d g } | } \break
    a2 \tuplet 3/2 { g4 d g } | a2. g4 | d'2. c4 | d2. a4 | \break
    c1~ | c4. \startParenthesis \parenthesize bes16( \endParenthesis \parenthesize c) \tuplet 3/2 { bes4 f bes }  |
    c1~ | c4~ \tuplet 3/2 { c8 bes c } \tuplet 3/2 { bes4 f g } | \break
    a4. \parenthesize 8 \tuplet 3/2 { 4 e f } | g4. \parenthesize 8 \tuplet 3/2 { g4 f e }
  }
  \alternative {
    {  d2. c4 | d2. c4  }
    {  f1 | R1 }
  }
  \bar "||" \break
  \mark #2 \tuplet 3/2 { es'4 d c } es2 ~ | es2. as,4 | g2. f4 | f1 \break
  \tuplet 3/2 { d'4 c bes } d2~ | d2. g,4 | f2. e4 | e2. c4 \bar "||" \break
  \mark #1  a'1~ | a2 \tuplet 3/2 { g4 d g } |  a1~ | a4. g8 \tuplet 3/2 { g4 d g } |  \break
  a2 \tuplet 3/2 { g4 d g } | a2. g4 | d'2. c4 | d2. a4 | \break
  c1~ | c2 \tuplet 3/2 { bes4 f g } | a1~ | a4 4 bes4 c |  \break
  d d d4. d8|d4 d d4. d8 |
  \override TextSpanner.bound-details.left.text = "Solo Break"
  d1 \startTextSpan
  r2. \startParenthesis \parenthesize
  c,8  \endParenthesis \parenthesize a' \laissezVibrer \stopTextSpan
  \bar ".."

}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  % \partial 8
  % \showStartRepeatBar \bar "[|:"


}

Basse = \relative c' {
  \clef "bass" \key f \major \time 4/4
  % \partial 8
  % \showStartRepeatBar \bar "[|:"

  \bar ".."
}
verse = \lyricmode {

  Speak low __ when you speak, love, __
  Our sum -- mer day wi -- thers a -- way
  Too soon, too soon.
  Speak low __ { \skip 1 } when you speak, love, __
  Our _ mo -- ment is swift, { \skip 1 } like ships a -- drift, { \skip 1 }
  We're swept a -- part too soon.
  Speak
  \skip 1
  Time is so old __ and love so brief,
  Love is pure gold __ and time a thief.
  We're late __ dar -- ling, we're late, __
  The cur -- tain des -- cends, ev -- 'ry -- thing ends
  Too soon, too soon,
  I wait __ dar -- ling, I wait __
  Will you speak low to me,
  Speak love to me and soon.
}

verseB = \lyricmode {
  \skip 1
  low, __ dar -- ling speak low, __
  Love is a spark lost in the dark,
  Too soon, too soon,
  I feel __ wher -- e -- ver I go __
  That to -- mor -- row is near, to -- mor -- row is here
  And al -- ways too \repeat unfold 4 { \skip 1 } soon.
}

grille = \chordmode {
  \bar "[|:" g1:m7 c:7 g:m7 c:7 \break
  \repeat percent 2 { \/g2:m7 c:7 } a1:m5-7 d:7 \break
  \repeat unfold 2 { bes:m7 es:7 } \break
  \/a2:m7 d:7 \/g:m7 c:7 \set Score.repeatCommands = #'((volta "1.") )
  \/f:6 bes:7+ \s a:m7 d:7 \break
  \set Score.repeatCommands = #'((volta #f) end-repeat)
  \stopStaff s1 \bar "" s \startStaff \set Score.repeatCommands = #'((volta "2.") )
  \repeat percent 2 { f:6 } \set Score.repeatCommands = #'((volta #f)) \break \bar "||"
  \repeat percent 2 { f:m7 } des:5+7 des:7 \break
  \repeat percent 2 { es:7+ } des:7 c:7
  g1:m7 c:7 g:m7 c:7 \break
  \repeat percent 2 { \/g2:m7 c:7 } a1:m5-7 d:7 \break
  bes:m7 es:7 a:m5-7 d:7 \break
  g:m7 c:7 f:6 \/a2:m7 d:7

  \bar ".." }

marques = \relative c' {
  s1 ^\markup \bold \box \fontsize #5 A s1*19
  s1 ^\markup \bold \box \fontsize #5 B s1*7
  s1 ^\markup \bold \box \fontsize #5 A
}


\book {
  \paper {
    #(set-paper-size "tablette")
    %page-count = #1
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    %page-count = #1
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    %page-count = #1
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a, \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
    } %\form
  }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )
          \override ParenthesesItem.extra-offset = #'(10 . -1 )
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 )
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } %\form
  }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )
          \override ParenthesesItem.extra-offset = #'(10 . -1 )
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 )
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c d \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a, \theNotes
        >>
      >>
    } %\form
  }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )
          \override ParenthesesItem.extra-offset = #'(10 . -1 )
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 )
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c a \grille
      >>
} } }

\book {
  \paper { page-count = #1
           #(set-paper-size "a4")}
  \bookpart {
    #(define output-suffix "Vocala4")
    \score {
      <<
        \new ChordNames \harmonies
        \new Staff <<
          \new Voice = m \theNotes
          \addlyrics \verse
          \addlyrics \verseB
      >> >>
    }
} }