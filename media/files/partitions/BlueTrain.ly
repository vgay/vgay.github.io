
\version "2.22.0"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

combo = ##t
title = #"Blue Train"
composer = #"John Coltrane"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Blues"

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
  asplayed = #"John Coltrane" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=XpZHUVjQydI"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
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
  s8 s2 es1:7 as:7 es1*2:7 as:7 es:7
  f1:m bes:7 es:7 f2:m bes:7
}


theNotes =  \relative c'' {
  \mark \markup "In unison 1st X"
  \clef "treble" \key as \major \time 4/4
  \override Rest #'staff-position = #0
  \partial 8*5 bes8 des f des es ~
  \repeat volta 2 {
    es1 | r4. bes8 des f des es ~ |
    es1 | r4. es,8 ges bes ges as ~ \bar "||"
    as1| \noBreak r4. bes8 des f des es ~ |
    es1 | r4. bes8 des ges es des ~ \bar "||"
    des1 | r4. bes8 des f des es ~ |
    es1 |
    r4.\startParenthesis \parenthesize bes8 des f des  \endParenthesis \parenthesize es \laissezVibrer
} }

PartTwo =  \relative c'' {
  \clef "treble" \key as \major \time 4/4
  \override Rest #'staff-position = #0
  \partial 8*5 ges8 as c as bes ~
  bes1 | r4. ges8 as c as bes ~ |
  bes1 | r4. bes8 c des c c ~ |
  c1 | r4. ges8 as c as bes ~ |
  bes1 | r4. ges8 bes des bes as ~ |
  as1 | r4. f8 as c as bes ~ |
  bes1 | r4. \startParenthesis \parenthesize ges8 as c as \endParenthesis \parenthesize bes \laissezVibrer
}

PartThree =  \relative c' {
  \clef "treble" \key as \major \time 4/4
   \override Rest #'staff-position = #0
 \partial 8*5 es8 f as f ges ~
  ges1 | r4. es8 f as f ges ~ |
  ges1 | r4. des8 es f es es ~ |
  es1 | r4. es8 f as f ges ~ |
  ges1 | r4. es8 ges bes ges d ~ |
  d1 | r4. es8 f as f ges ~ |
  ges1 | r4.  \startParenthesis \parenthesize es8 f as f \endParenthesis \parenthesize ges \laissezVibrer
}

voicing =  \relative c' {
  \clef "treble" \key as \major \time 4/4
  \once \override Score.RehearsalMark.break-align-symbols = #'(clef)
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup "Voicing sur dernière grille de chaque chorus"
  \partial 4 es4-. \mark \markup \pad-markup #2 " "
  \repeat volta 2 {
    as2.( ~ as8 ges-.) | r4 r8 bes,( des8. bes16 d8 es) | R1 |
    r2 r4 es-.
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
    \mark \markup \bold "3x"
  }
}

piano =  \relative c' {
  \clef "treble_8" \key as \major \time 4/4
  \once \override Score.RehearsalMark.break-align-symbols = #'(clef)
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup "Voicing piano et ligne de basse"
  \partial 8*5 r8 r2
  \repeat volta 2 {
    r2 <g des' ges>4. <g des' ges>8 | R1
    r2 <g des' ges>4. <g des' ges>8 | R1 \bar "||"
    r2 <ges bes d f>4. <ges bes d f>8 | R1
    r2 <g! des' ges>4. <g des' ges>8 | R1 \bar "||" \break
    r2 <d as' des>4. <d as' des>8 | R1 |
  }
  \alternative {
    {  r2 <g des' ges>4. <g des' ges>8  | R1  }
    {  r2 <g des' ges>4. <g des' ges>8  ~ | <g des' ges>1 }
  }
  \bar "|."
}

basse =  \relative c {
  \clef "bass" \key as \major \time 4/4
  \partial 8*5 r8 r2
  \repeat volta 2 {
    r2 bes4. es,8 | R1 | r2 bes'4. es,8 | R1 |
    r2 es4. as8 | R1 | r2 bes4. es,8 | R1 | r2 f4. bes8 | R1 |
  }
  \alternative {
    { r2 bes4. es,8 | R1 }
    { r2 bes'4. es,8 ~ | es1 }
  }
  \bar "|."
}

grille = \chordmode {
  \bar "[|:"

  \bar ".." }

marques = \relative c' {

}

rythmique = \chordmode {
  s8 s2 es1:9+ as:7 es1*2:9+ as:11+ es:9+ f1:m bes:7
  es:7 f2:m bes:7
  es:7 f2:m bes:7
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
        \new Staff \PartTwo
        \new Staff \PartThree
      >>
    } %\form
    \score { \new Staff \voicing }
  }
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \rythmique
        }
        \new StaffGroup <<
          \new Staff  << \piano  \\ {  s8 s2 s1*4 \break  s1*4 \break  } >>
          \new Staff  \basse
        >>
      >>
} } }

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
        \new Staff \transpose c d \PartTwo
        \new Staff \transpose c d \PartThree
      >>
    } %\form
    \score { \new Staff \transpose c d \voicing }
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
        \new Staff \transpose c a \PartTwo
        \new Staff \transpose c a \PartThree
      >>
    } %\form
    \score { \new Staff \transpose c a \voicing }
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
          \theNotes \\ { s8 s2 s1*4 \break  s1*4 \break  }
        >>
        \new Staff \PartTwo
        \new Staff \PartThree
      >>
    } %\form
    \score { \new Staff \voicing }
    \markup " "
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \rythmique
        }
        \new Staff  << \piano  \\ {  s8 s2 s1*4 \break  s1*4 \break  } >>
        \new Staff  \basse
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
          \transpose c d \theNotes\\ { s8 s2 s1*4 \break  s1*4 \break  }
        >>
        \new Staff \transpose c d \PartTwo
        \new Staff \transpose c d \PartThree
      >>
    } %\form
    \score { \new Staff \transpose c d \voicing }
} }

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
          \transpose c a \theNotes\\ { s8 s2 s1*4 \break  s1*4 \break  }
        >>
        \new Staff \transpose c a \PartTwo
        \new Staff \transpose c a \PartThree
      >>
    } %\form
    \score { \new Staff \transpose c a \voicing }
} }