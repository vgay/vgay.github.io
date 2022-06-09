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
  system-system-spacing = #'((basic-distance . 20)
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

title = #"Looking Up"
composer = #"Michel Petrucciani"
meter = #"(Samba)"
kwtempo = #"Fast"
kwstyle = #"Samba"

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
  asplayed = #"Michel Petrucciani" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=gD6GAS5CZtQ"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  subtitle = \markup { \raise #-1 "music transposed a tone and a half lower" }
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




harmonies = \chordmode {
  \set chordChanges = ##f
  \repeat unfold 4 { des2.. ges8/des s1  }
  ges1:7+ \parenthesize des2:m7 ges:7 ces1:7+ fes:13 ges1:7+ \parenthesize des2:m7 ges:7 ces1:7+  bes:7
  es:m7 as:7 des:7+ bes:m7 c:m s1 f:7 s
  bes:m7 bes:m9/as ges:7+ es2:m7 as:7 bes1:m7 fes:7.11+ es1:7 f:7
  bes:m7 bes:m9/as g:m5-7 c:9- f:13 ges:7 f:7 ces:5-7
  bes:m7 bes:m9/as ges:7+ es2:m7 as:7
  \repeat unfold 4 { des2.. ges8/des s1  }
}

theNotes =  \relative c' {
  \clef "treble" \key des \major \time 4/4 \mark \markup \box Intro
  \override TextSpanner.bound-details.left.text = "8va 2nd X"
  R1*4 \break R1*3 | r4 r8 des es f ges16 as bes ces \bar "||-[|:" \break
  \mark #1
  \repeat volta 3 {

    des2.~ \startTextSpan 8 bes~ | 2. ~ 8 des16 bes | as1~ | 2 r8 ges~ \tuplet 3/2 { ges as ges } |
    des'1~ | \tuplet 3/2 { des4 bes es } des bes8 as~ | 1~ | 4. ges8~ ges as4 ges8 | \break
    des'2.~ 8 bes~ | 2. ~ 8 as~ | 2. f8 des~ | 2~ 8 es f es~ |
    1~ | 1 \stopTextSpan | R | r2 r8 f es des'~ \break \bar "||" }

  \alternative {
    {
      \mark #2 2~ 8 f, es es'~ | 2~  8 f, es r | \tuplet 3/2 { r4 f' es } des bes8 as | r4 r8 f es4 des
      des4. bes8~ 2~ |  1 | R1 r4 r8 des' es f ges16 as bes ces \break
    }
    { \mark #3 des,1~ \repeatTie | des4. c8 es4 des | c1~ | 4. bes8 des4 c8 a~ | 2. f4 | ges4. bes8~ 8 as4 ges8 | fes4 4~ 8 4 8 | r des es f ges as bes ces \break }
    {
      \mark #4 2~ \repeatTie 8 f, es es'~ | 2~  8 f, es r | \tuplet 3/2 { r4 f' es } des bes8 as | r4 r8 f es4 des
      \bar "||" \break }
  }

  des1~ | 1 R R | \improvisationOn \withMusicProperty untransposable ##t { bes'4 8 8~ 8 4 8~ | 8 8 8 8 4 4 | 4 8 8~ 8 4 8~ | 1 }
  \bar ".."
  \label #'theLastPage
}


Basse = \relative c {
  \clef "bass" \key des \major \time 4/4
  << { r4 <f as des>8 q~ q4. <ges bes>8~ | q1 | <f as>2.~ q8 <ges bes>8~ | q1 |
       <f as>2.~ q8 <ges bes>8~ | q2. r8 q8 | <f as des>2.. <ges bes>8~ | q2. } \\
     { des2~ 8 4 8~ | 4. 8 4 4 | 4. 4 4 8~ | 4. 8 4 4 | 4. 4 4 8~ | 4. 8 4 4 | 4. 4 4 8~ | 2. } >> r4 |
}

grille = \chordmode {
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup \box Intro \bar "[|:"
  \repeat volta 2 { \repeat unfold 2 { des1 ges/des } } \break
  \bar ":|][|:" \mark #1 ges1:7+ des2:m7 ges:7 ces1:7+ fes:7  \break
  ges:7+  des2:m7 ges:7 ces1:7+ bes:7  \break
  es:m7 as:7 des:7+ bes:m7  \break
  \repeat percent 2 { c:m } \repeat percent 2 { f:7 } \break \bar "||"
  \set Score.repeatCommands = #'((volta "1.") ) \mark #2
  bes:m \set Score.repeatCommands = #'((volta #f)) bes:m7/as ges:7+ es2:m7 as:7 \break
  bes1:m7 fes:7.11+ es:7 f:7 \break
  \set Score.repeatCommands = #'((volta "2.") end-repeat) \mark #3
  bes:m \set Score.repeatCommands = #'((volta #f)) bes:m7/as g:m5-7  c:7 \break
  f:7 ges:7 f:7 ces:5-7
  \set Score.repeatCommands = #'((volta "3.") end-repeat) \mark #4
  bes:m  \set Score.repeatCommands = #'((volta #f)) bes:m7/as ges:7+ es2:m7 as:7 \break \bar "||"
  des1 ges/des des ges/des \break
  \repeat unfold 2 { des ges/des }
  \bar ".." }



\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol }
          << { \oneVoice \theNotes } \\ { s1*24 \pageBreak } >>
          \new Staff \Basse
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb }  \transpose c d \theNotes
      >>
    }
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } \transpose c a \theNotes
      >>
    }
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    print-page-number = ##f
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol }  \theNotes
          \new Staff \Basse
      >> >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    print-page-number = ##f
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb  } \transpose c d \theNotes
          \new Staff \Basse
      >> >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    print-page-number = ##f
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new StaffGroup <<
          \new ChordNames { \transpose c a \harmonies }
          \new Staff \with { instrumentName = \Eb } \transpose c a \theNotes
          \new Staff \Basse
      >> >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }
