
\version "2.19.80"
#(set-global-staff-size 18)
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
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Elm"
composer = #"Richie Berard"
meter = #"(Med. Straight eighths )"
kwtempo = #"Medium"
kwstyle = #"Straight"

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
  arranger = \markup \with-color #red { "Intro rytmique 8 premières mesures de" \box A }
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
    \override NonMusicalPaperColumn #'line-break-permission = ##f
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
}


\layout {
  \context {
    \Score
    extraNatural = ##f
    \omit BarNumber
    skipBars = ##t
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}

harmonies = \chordmode {
 
  s4 fis1:dim7/g s g:m s 
  fis1:dim7/g s g:m s 
  as/c d:7/c bes2:5+7+9 e:9+ es1:7+9.11+
  a:m5-7.11 as:7+9.11+ e:m11 s
  g s c:7+/g fis:dim7/g g:7+9 g:7+ fis:dim7/g s g:9sus4 g:7+
  f:7+/c d:7/c g2:/b b:5+ es1:7+/bes a:m5-7.11 as:7+9.11+
  g2:5.9sus4 g4:1.3.5.9 g:1.3.5.9.13-
}

piano =  \relative c {
  \clef "bass" \key bes \major \time 4/4
 \partial 4 r4
  \repeat percent 2 << { r8 <es a>4 q8 ~ q q4 q8 } \\ { g,1 } >>
  \repeat percent 2 << { r8 <d' bes'>4 q8 ~ q q4 q8 } \\ { g,1 } >>
  \repeat percent 2 << { r8 <es' a>4 q8 ~ q q4 q8 } \\ { g,1 } >>
  \repeat percent 2 << { r8 <d' bes'>4 q8 ~ q q4 q8 } \\ { g,1 } >>
  << { r8 <as' es'>4 q8 ~ q q4 q8 } \\ { c,1 } >>
  << { r8 <fis a! d >4 q8 ~ q q4 q8 } \\ { c1 } >>
  <bes fis' a c>2 <e b' gis> | <es, bes' f' g a>1\arpeggio |
  <a g' c d> | <as es' f bes> |
  << { r8 b e <fis g a>~ q2~ | q1 } \\ { e,1~ | e } >>
  << { d'2. <d b'>4 | q4. q8~ q4 q } \\ { g,4. 8 ~ 8 4 8~ | 2~ 8 4 8 } >>
  \key g \major
  << { r8 <e' b' c>4 q8 ~ q q4 q8 } \\ { g,1 } >>
  << { r8 <es' a>4 q8 ~ q q4 q8 } \\ { g,1 } >>
  << { r8 <d' a'>4 q8 ~ q q4 q8 } \\ { g,1 } >>
  << { r8 <d' b'>4 q8 ~ q q4 q8 } \\ { g,1 } >>
  \repeat percent 2 << { r8 <es' a>4 q8 ~ q q4 q8 } \\ { g,1 } >>
  << { r8 <d' a'>4 q8 ~ q q4 q8 } \\ { g,1 } >>
  << { r8 <d' b'>4 q8 ~ q q4 q8 } \\ { g,1 } >>
  << { r8 <a' e' f>4 q8 ~ q q4 q8 } \\ { c,1 } >>
  << { r8 <fis a d>4 q8 ~ q q4 q8 } \\ { c1 } >>
  << { r8 <g' d'>4 q8  r <g dis'>4 q8 } \\ { b,2 b } >>
  << { r8 <g' d' es>4 q8 ~ q q4 q8 } \\ { bes,1 } >>
  << { r8 <g' d' es>4 q8 ~ q q4 q8 } \\ { a,1 } >>
  << { <es' bes'>2~ q8 <es a> <f bes> <es a> } \\ { <as,, as'>1 } >>
  << { <g g' d' a'>1 \fermata } \\ { r2 r4 es'' ^\fermata } >>
}

voltaAdLib = \markup \with-color #red { \text \fontsize #4 { Themes et Solos } }
voltaOnCue= \markup \with-color #red { \text \fontsize #4 { Dernier thème } }

theNotes =  \relative c'' {
  \clef "treble" \key bes \major \time 4/4
  \partial 4 a8 bes  \A
  \repeat volta 2 {
    c2 es | a,2.~ 8 c | bes c d2.~ | 2 r4 a8 g |
    fis2. cis8 d | f!2. es8 c | d1~ | 2 r4 a'8 bes | \break \noPageBreak
    c2 es | a,2.~ 8 c |  
    <<
      { bes c d2~ \tuplet 3/2 { d8 es f } | g2~ \tuplet 3/2 { 4 a es } |\break \noPageBreak  d2~ 8 c g es }
      \\
      { d2 <d g> | a' bes | <es, bes>1 }
    >> 
    d2. \tuplet 3/2 { c8 d c } }
  \alternative {
    { \set Score.repeatCommands = #(list(list 'volta voltaAdLib)) b1~ 2 r4  a'8   bes  } 
    { \set Score.repeatCommands = #(list '(volta #f) (list 'volta voltaOnCue) 'end-repeat) b,1~ | 2 r4 a'8 bes | } 
  }\break
  \B \key g \major \bar "||"
  <e, c'>2 <g e'> | <c, a'>2.~ q8 <es c'> | <d b'> <e! c'> <fis d'>2. ~ | 
  q2 r8 << { b8 a g } \\ { d4. } >> 
  <c fis>2. cis8 d | <c! f>2. es8 c~ | \break
  <c d>1~ |d2 r4 a'8 b | 
  c2 e | a,2.~ 8 c | 
  b c d2~ \tuplet 3/2 { d8 es f } | g2~ \tuplet 3/2 { 4 a es } | \break \noPageBreak
  d2~ 8 c g es
  d2~\fermata d8 c d c | c2\fermata b\fermata \bar ".."
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
    page-count = #2
  }
  \header { poet = \markup \with-color #red \pad-around #1 "Partition sur 2 pages" }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } \theNotes
          \new ChordNames { \set chordChanges = ##t \harmonies }
          \new Staff  \piano
      >> >>
} } }


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  \header { poet = \markup \with-color #red \pad-around #1 "Partition sur 2 pages" }
  #(define output-suffix "BbTab") 
  \bookpart {
    \score {
      <<
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb } \transpose c d \theNotes
          \new ChordNames { \set chordChanges = ##t \transpose c d \harmonies }
          \new Staff  \transpose c d \piano
      >> >>
} } }


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  \header { poet = \markup \with-color #red \pad-around #1 "Partition sur 2 pages" }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb } \transpose c a \theNotes
          \new ChordNames { \set chordChanges = ##t \transpose c a \harmonies }
          \new Staff  \transpose c a \piano
      >> >>
} } }


\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } \theNotes
          \new ChordNames { \set chordChanges = ##t \harmonies }
          \new Staff  \piano
      >> >>
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
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb } \transpose c d \theNotes
          \new ChordNames { \set chordChanges = ##t \transpose c d \harmonies }
          \new Staff  \transpose c d \piano
      >> >>
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
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb } \transpose c a \theNotes
          \new ChordNames { \set chordChanges = ##t \transpose c a \harmonies }
          \new Staff  \transpose c a \piano
      >> >>
} } }