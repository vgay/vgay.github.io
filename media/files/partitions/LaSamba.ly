
\version "2.22.1"
#(set-global-staff-size 17)
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
  markup-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
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

title = #"La Samba"
composer = #"Ray Odiebo"
meter = #"(Mod. Samba)"
kwtempo = #"Medium"
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
  asplayed = #"Andy Narell" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=89NhDgIPgzE"
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
    %\override Clef #'break-visibility = #'#(#f #f #f)
    %\override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
    \override MultiMeasureRest #'expand-limit = #2
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
  \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
             \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  }
}



form = \markup  \fill-line {
  \column {  }
  \column { \line {  \fontsize #2 "Solos on AB" \smaller "(use 2nd ending each time)" \with-color #red "After solos D.C. al fine"} }}


harmonies = \chordmode {
  \set chordChanges = ##f
  \repeat unfold 4 { g1:m7 a:m7 d:9sus s }
  bes:7+ a:5+9- d:m7 g:5-7 g:m7 a:5+9- d:m7 g:5-7
  g:m7 a:5+9- d:m7 g:5-7 g:m7 a2..:5+9- es8:7+5- s1*2 r4. c8/d s1.
   es1*3:5-7+
  d1*4:m bes:7+ d:m bes1*3:7+ a4.:sus bes2:6.9 g8:sus g1...:sus g8:5-7 s1
  g4.:m7 a2:5+9- d8:9sus4 s1*2
  d1:9sus4 a4.:sus bes2:6.9 g8:sus d1.:9sus  s8 d:1.5.9
}


theNotes =  \relative c'' {
  \clef "treble" \key f \major \time 2/2
  \showStartRepeatBar \bar "[|:" \mark #1 \oneVoice
  \repeat volta 2 {
    d2~ 8 c r d~ | d2~ 8 c r a~ | a1~ | a2. r4 |
    d2~ 8 c r d~ | d2~ 8 f r e~ | e1~ | e2. r4 | \break
    d2~ 8 c r d~ | d2~ 8 c r a~ | a1~ | a2. r4 |
    d2~ 8 c r d~ | d2~ 8 f r e~ | e1~ | e4 r e8 cis d e | \break \bar "||"
    \mark #2 f2~ 8 a r g8~ | 2~ 8 f e f8~ | 2~ 8 a r  g8~ | 2~ 8 f e f8~ |
    2~ 8 a r bes8~ | 2~ 8 a g a8~ |  1~ | 2. r4 | \break
    f2~ 8 a r g8~ | 2~ 8 f e f8~ | 2~ 8 a r  g8~ | 2~ 8 f e f8~ |
    2~ 8 a r bes8~ \break
    2~ 8 a g a8~ |  1~
  }
  \alternative {
    { | a2.. a,8 | d, a' d e r e4.~ | 1  }
    { a1~ \repeatTie | 1~ | 1  \break  \bar "||" }
  }
  \mark #3
  R1*3 | d,4-. f8 e r c r d8~ | 1~ | 1 | R |
  d4-. f8 e r c r a8~ | \break 1~ | 1 | R |
  d4-. f8 e r c r d8~ | 1~ | 1 | R |
  d4-. d8 f r f r e~ \break \noPageBreak \mark #4
  \repeat volta 2 {
    e1~ | 1~ | 2 r | d4-. d8 f r f r e~ | e1~ | 1~  \noPageBreak }
  \alternative {
    {e2 r | d4-. d8 f r f r e\laissezVibrer  }
    { e1~ \repeatTie  }
  }
  2 r8 d'-^ r d-^ |
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark #'direction = #DOWN
  \mark \markup \with-color #red "Fine"
  \inlineMMRN R1*8 ^\markup \teeny "Percussions Break" \bar ".."
   \label #'theLastPage
}


chordsRhythm = \relative c' {
%   \override Rest #'staff-position = #7
%   \improvisationOn \override NoteHead.no-ledgers = ##t
\clef "treble" \key f \major \time 2/2
  s1*37 |
  r4 ^\markup \small piano r8 <f a d> r <e g c> r4 | r2 <f a d>8 q <e g c>4-.|
  r4 r8 <f a d> r <e g c> r4 | r2 <f a d>8 q <e g c>4-.|
  r4 r8 <f a d> r <e g c> r4 | r2 <f a d>8 q <e g c>4-.|
  r4 r8 <f a d> r <e g c> r4 | r2 <f a d>8 q <e g c>4-.| r4 r8 <f a d> r <e g c> r4 | r2 <f a d>8 q <e g c>4-.|
  r4 r8 <f a d> r <e g c> r4 | r2 <f a d>8 q <e g c>4-.| r4 r8 <f a d> r <e g c> r4 | r2 <f a d>8 q <e g c>4-.|
  r4 r8 <f a d> r <e g c> r4 | R1
}

Basse = \relative c' {
  \override Rest #'staff-position = #0
  \clef "bass" \key f \major \time 4/4
  s1*29 | a4 ^\markup \small bass r a8 g d es~ | es1~ | 2. r8 a, | d a' d d r8 d4.~ | d1
  es,1~ \repeatTie | 1~ | 2 r4 r8  a
  d, a' d4-. r4 r8  a | d, a' d a r4 r8  a | d, a' d4-. r4 r8  a | d, a' d a r4 r8  f |
  bes, f' bes4-. r4 r8  f | bes, f' bes f r4 r8  f | bes, f' bes4-. r4 r8  f | bes, f' bes f r4 r8  a |
  d, a' d4-. r4 r8  a | d, a' d a r4 r8  a | d, a' d4-. r4 r8  a | d, a' d a r4 r8  f |
  bes, f' bes4-. r4 r8  f | bes, f' bes f r4 r8  f |
  bes, f' bes4-. r4 r8  f | a4-. a8 bes r bes r g \laissezVibrer

}

grille = \chordmode {
  \bar "[|:"

  \bar ".." }

marques = \relative c' {
  s1 ^\markup \bold \box \fontsize #7 A s1*7
  s1 ^\markup \bold \box \fontsize #7 B s1*7
  s1 ^\markup \bold \box \fontsize #7 A
}


\book {
  \paper {
    #(set-paper-size "tablette")
    %page-count = #2
    print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
  \header { meter = \markup \with-color #red \bold "partition sur 3 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
        \new StaffGroup <<
        \new Staff  \chordsRhythm
        \new Staff  \Basse
      >> >>
    } \form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
    print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  \header { meter = \markup \with-color #red \bold "partition sur 3 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } \form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    %page-count = #2
    print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  \header { meter = \markup \with-color #red \bold "partition sur 3 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a, \theNotes
        >>
      >>
    } \form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    print-first-page-number = ##t
      system-system-spacing = #'((basic-distance . 16)
                             (minimum-distance . 12)
                             (padding . 0))
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes \\ { s1*61 \break }
        >>
        \new Staff \chordsRhythm
        \new Staff \Basse
      >>
    } \form

} }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    print-first-page-number = ##t
      system-system-spacing = #'((basic-distance . 16)
                             (minimum-distance . 12)
                             (padding . 0))
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes \\ { s1*61 \break }
        >>
        \new Staff  \transpose c d \chordsRhythm
        \new Staff  \transpose c d \Basse
      >>
    } \form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    print-first-page-number = ##t
      system-system-spacing = #'((basic-distance . 16)
                             (minimum-distance . 12)
                             (padding . 0))
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a, \theNotes \\ { s1*61 \break }
        >>
        \new Staff \transpose c a \chordsRhythm
        \new Staff \transpose c a, \Basse
      >>
    } \form
 } }

