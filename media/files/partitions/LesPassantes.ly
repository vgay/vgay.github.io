
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

title = #"Les passantes"
composer = #"Georges Brassens"
meter = #"(Ballad)"
kwtempo = #"Medium"
kwstyle = #"Ballad"
kwfrench = #"Oui"

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

voltaAdLib = \markup { 1. 2. 3… \italic \text "ad lib." }
voltaOnCue = \markup \small \text "Last X"

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  % asplayed = #"" % doit être commentée si vide
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



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
  s8 f1:7+ e:7 a:7 d:7 d:m7 g:7 c:7+ e:7
  f1:7+ e:7 a:7 d:7 a:m7 g:7 a:m7 g2:m7 c:7 a1:m
}

theNotes =  \relative c'' {
  \clef "treble" \key c \major \time 4/4
  \partial 8 e8
  \repeat volta 2
  {
    a4 a8  a8 ~  a8
    b4  a8 | % 2
    gis8  e8 ~  e2 r8  e8 | % 3
    a8  e4  f8  g8  f4
    e8 | % 4
    d8  a8 ~  a2 r8  a8 \break | % 5
    c2  a4  c8  b8 ~ | % 6
    b2  g'4  a8  e8 ~ | % 7
    e1 | % 8
    r2 r4.  e8 | \break
    a4  a8  a8 ~  a8
    b4  a8 |
    gis8  e8 ~  e2  \parenthesize c'8
    b8 | % 11
    a8  e4  f8  g8  f4
    e8 | % 12
    d8  a8 ~  a2 r8  a8 \break | % 13
    c4.  e8 ~  e4  a4 | % 14
    d,4.  b8 ~  b4  g4 | % 15
    a1
  }
  \alternative {
    {
      \overrideProperty Score.VoltaBracket.text \voltaAdLib
      r2 r4.  e'8 }
    {
      \overrideProperty Score.VoltaBracket.text \voltaOnCue
      R1 \bar ".." }
  }
}

chordsRhythm = \relative c''' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key f \major \time 4/4
}

grille = \chordmode {
  \bar "[|:"
  f1:7+ e:7 a:7 d:7 \break
  d:m7 g:7 c:7+ e:7 \break
  f1:7+ e:7 a:7 d:7 \break
  a:m7 g:7 a:m7 \set Score.repeatCommands = #'((volta "1")) \s g2:m7 c:7
  \set Score.repeatCommands = #'((volta #f) end-repeat)
  \stopStaff s1 \bar "" s1 \bar "" s1 | \startStaff
  \set Score.repeatCommands = #'((volta "2")) a:m
  \set Score.repeatCommands = #'((volta #f)) \bar ".."
}

marques = \relative c' {

}

verse = \lyricmode {
  Je veux dé -- dier ce po -- è -- me __
  A tou -- tes les fem -- mes qu'on ai -- me __
  Pen -- dant quel -- ques ins -- tants se -- crets __
  A celles qu'on con -- naît à pei -- ne __
  { \skip 1 } Qu'un des -- tin dif -- fé -- rent en -- traî -- ne __
  Et qu'on ne re -- trou -- ve ja -- mais
}

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
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
    page-count = #1
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
    page-count = #1
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
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
    page-count = #1
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
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a \theNotes
        >>
      >>
    } %\form
    %}  \bookpart {
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
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  \header { arranger = "sur un Poème d'Antoine Pol" }
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
        >>
      >>

    }

    \markup {
      \vspace #5
      \fill-line {
        \hspace #1
        \column {
          \line { 2- }
          \line { A celle qu'on voit apparaître }
          \line { Une seconde à sa fenêtre }
          \line { Et qui, preste, s'évanouit  }
          \line { Mais dont la svelte silhouette  }
          \line { Est si gracieuse et fluette  }
          \line { Qu'on en demeure épanoui. }
          \hspace #2

          \line { 4- }
          \line { A celles qui sont déjà prises }
          \line { Et qui, vivant des heures grises }
          \line { Près d'un être trop différent  }
          \line { Vous ont, inutile folie, }
          \line { Laissé voir la mélancolie  }
          \line { D'un avenir désespérant. }
        }
        \hspace #2
        \column {
          \line { 3- }
          \line { A la compagne de voyage }
          \line { Dont les yeux, charmant paysage }
          \line { Font paraître court le chemin  }
          \line { Qu'on est seul, peut-être, à comprendre }
          \line { Et qu'on laisse pourtant descendre }
          \line { Sans avoir effleuré la main. }
          \hspace #2

          \line { 5- }
          \line { Chères images aperçue }
          \line { Espérances d'un jour déçues }
          \line { Vous serez dans l'oubli demain }
          \line { Pour peu que le bonheur survienne }
          \line { Il est rare qu'on se souvienne }
          \line { Des épisodes du chemin. }
        }
        \hspace #1
      }
    }
} }
