\version "2.22.1"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "chord-grid-JAS.ly"



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
  system-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 8)
                             (padding . 0))
  oddHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \null \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} }
  } }
  evenHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} \null }
    }
  }
}

title = #"Slow Hot Wind"
composer = #"Henri Mancini"
meter = #"(Slow Samba)"
kwtempo = #"Samba"
kwstyle = #"Medium"

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
}


form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f

a1:m9 \once \override ChordName.font-size = #-1  \parenthesize f:9.11+
a:m9 s2 \once \override ChordName.font-size = #-1  \parenthesize es:9.11+ d1:m9
\once \override ChordName.font-size = #-1  \startParenthesis \parenthesize b2:m5-7
\once \override ChordName.font-size = #-1  \endParenthesis \parenthesize e:5+7.9-
a1:m9 s

a1:m9 \once \override ChordName.font-size = #-1  \parenthesize f:9.11+
a:m9 s2 \once \override ChordName.font-size = #-1  \parenthesize es:9.11+ d1:m9
\once \override ChordName.font-size = #-1  \startParenthesis \parenthesize b2:m5-7
\once \override ChordName.font-size = #-1  \endParenthesis \parenthesize e:5+7.9-
a1:m9 s2 \once \override ChordName.font-size = #-1  \parenthesize ges:9.11+

f1.:7+ e2:7+ es1*2:7+ es2:m9 as:9sus4 des1:7+ c:7+ b2:m7 e:9-

a1:m9 \once \override ChordName.font-size = #-1  \parenthesize f:9.11+
a:m9 s2 \once \override ChordName.font-size = #-1  \parenthesize es:9.11+ d1:m9
\once \override ChordName.font-size = #-1  \startParenthesis \parenthesize b2:m5-7
\once \override ChordName.font-size = #-1  \endParenthesis \parenthesize e:5+7.9-
a1:m9
\once \override ChordName.font-size = #-1  \startParenthesis \parenthesize b2:m5-7
\once \override ChordName.font-size = #-1  \endParenthesis \parenthesize e:5+7.9-

}


theNotes =  \relative c' {
  \clef "treble" \key c \major \time 2/2
  \mark #1
  \repeat unfold 2 { e2 b'~ | 2. a4 | \tuplet 3/2 { dis,4 e d' } b2~ | b a |
                     e1~ | 2 c | b1~ | 2 r | \break }
  \mark #2 \bar "||"
  \tuplet 3/2 { e'4 d c } b2~ | 4 c8 d dis4 gis, | g!2 d'~ | 4 g, bes c
  des f~ \tuplet 3/2 { f es des } | c2. f,4 | e?2 b'~ | 2. r4
  \break \mark #1 \bar "||"
  e,2 b'~ | 2. a4 | \tuplet 3/2 { dis,4 e d' } b2~ | b a |
  e1~ | 2 < c  c'> | <b b'>1~ | q2 r
   \bar ".."
  \label #'theLastPage
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t



}

Basse = \relative c' {
  \clef "bass" \key f \major \time 4/4
  % \partial 8
  % \showStartRepeatBar \bar "[|:"

  \bar ".."
}

grille = \chordmode {
  \mark #1
  \bar "[|:" a1:m9 f:9.11+ a:m9 a2:m9  es:9.11+ \break
  d1:m9 b2:m5-7 e:5+7.9- a1:m9
  \set Score.repeatCommands = #'((volta "1.") ) a:m9
  \set Score.repeatCommands = #'((volta #f) end-repeat) \break
  \stopStaff s1 \bar "" s \bar "" s \startStaff
  \set Score.repeatCommands = #'((volta "2.") ) a2:m9 ges:9.11+
  \set Score.repeatCommands = #'((volta #f)) \bar "||" \break \mark #2
  f1:7+ f2:7+ e2:7+ \repeat percent 2 { es1:7+ } \break
  es2:m9 as:9sus4 des1:7+ c:7+ b2:m7 e:9- \bar "||" \break \mark #1
 a1:m9 f:9.11+ a:m9 a2:m9  es:9.11+ \break
 d1:m9 b2:m5-7 e:5+7.9- a1:m9 b2:m5-7 e:5+7.9-
  \bar ".." }

verse = \lyricmode {
Her gaze
Swept o -- ver me
Like __ a slow hot wind __

Some days __
It's too warm to fight __
A slow __ hot wind __

There in the shade__
Like a cool drink wai -- ting __
She sat with slow fire __ in her eyes
Just wai -- ting __

Some days __
It's too warm to fight __
A slow __ hot wind __
}


\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    %print-first-page-number = ##t
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
    #(set-paper-size "a5landscape")
    %page-count = #1
    %print-first-page-number = ##t
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
    #(set-paper-size "a5landscape")
    %page-count = #1
    %print-first-page-number = ##t
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
    %}  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
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
    %}  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
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
    %}  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    system-system-spacing = #'((basic-distance . 17)
                             (minimum-distance . 15)
                             (padding . 0))
  }
  #(define output-suffix "Vocala4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
          \addlyrics \verse
          \\ { \repeat unfold 7 { s1*4 \break } }
        >>
      >>

    }
}}