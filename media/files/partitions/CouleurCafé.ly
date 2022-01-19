
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
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"Couleur Café"
composer = #"Serge Gainsbourg"
meter = #"(Med. Up Latin)"
kwtempo = #"Med. Up"
kwstyle = #"Latin"

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
  % asplayed = #"" % doit être commentée si vide
  url = #""
  arranger = "Arr. Vincent Gay"
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
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  r1*5
 c2..:7 bes8 s1 c2..:7 bes8 s1 c2..:7 bes8 s1 c2..:7 bes8 s1  bes1
  c1*2:7 bes a:m7 as:7 c:7 d:m7 e:m7 f:7+
}

harmoniesR = \chordmode {
  \set chordChanges = ##t
  r1*4
  c1:7 bes c:7 bes
  c1*2:7 bes a:m7 as:7 c:7 d:m7 e:m7 f:7+ c:6
}


theNotes =  \relative c'' {
  \clef "treble" \key f \major \time 2/2
  \showStartRepeatBar \bar "[|:" \mark \markup \bold \box Intro
  \repeat volta 4 { R1*3 }
  \alternative {
    { R1 } { r2 r4 c8 d }
  }
  \bar "||-[|:"
  \mark #1 \break
  \repeat volta 2 {
    e4 c8 f4 e d8 ~ | % 18
    d2. r4 | % 19
    c4 g8 g4 g g8 ~ |
    g2. r4 |
    e'4 c8 f4 e
    d8 ~ | % 22
    d2. r4 | % 23
    c4 g~ 8 g4 g8~ | }
  \alternative {
    { g g4 g8 a4 g8 d' }  { g,\repeatTie g4 g8 a4 r }
  }
  \break \bar "||" \mark #2
  c4 e2. ~ | % 34
  e2. r4 | % 35
  d4 f2. ~ | % 36
  f2. r4 |
  \times 2/3 { e4 f e } \times 2/3 { f e g~ }  |
  g2 r8 e4 c8 ~ | % 39
  c1 |
  R1 | \break
  c4 e2. ~ |
  e2. r4 | % 35
  d4 f2. ~ | % 36
  f2. r4 | % 37
  \times 2/3 { e4 f e } \times 2/3 { f e g~ } |
  g2 r8 e4 c8 ~ | % 39
  c1
  \once \override TextScript #'extra-offset = #'( -6.5 . 0.4 )
  r2 ^\markup \fontsize #1 \sans  \concat { "(C" \raise #1 \fontsize #-1 "6" " last X)"} r4 \startParenthesis \parenthesize c8 \endParenthesis \parenthesize d  |
}

Tenor =  \relative c' {
  \clef "treble_8" \key f \major \time 2/2
  \repeat volta 2 { R1*3 }
  \alternative {
    { R1 } { r2 r4 c8 d }
  }
  R1*9
  e4 g2. ~ | % 34
  g2. r4 | % 35
  f4 d2. ~ | % 36
  d2. r4 | % 37
  \times 2/3 { c4 d c } \times 2/3 { d c e~ }  | % 38
  e2 r8 c4 es,8 ~ | % 39
  es1 |
  R1 | % 41
  e'4 g2. ~ | % 42
  g2. r4 | % 43
  f4 d2. ~ | % 44
  d2. r4 | % 45
  \times 2/3 { b4 c b } \times 2/3 { c b e~ }  |% 46
  e2 r8 b4 a8 ~ | % 47
  a1
  R1
}

chordsRhythm = \relative c' {
  \clef "treble_8" \key f \major \time 2/2
  R1*4
  \improvisationOn
  b2.. 8~ | 2. 4  | b2.. 8~ | 1
  \improvisationOff
   g'4  c8 bes r a4
 g8 | % 34
 r8 c4 e,8 r f4 g8 | % 35
 f4 bes8 f r d4
 bes8 | % 36
 r8 bes'4 d,8 r f4 g8 | \break
 e4 a8 g r e4
 c8 | % 38
 r8 e4 c8 r e4 g8 | % 39
 es4 c8 bes r as4
 es8 ~ |
 es4. c'8 ~ c4 es | \break
 g4  c8 bes r a4
 g8 | % 42
 r8 c4 e,8 r f4 g8 | % 43
 f4 a8 f r d4 a8
 | % 44
 r8 a'4 d,8 r e4 f8 | \break
 e4 b'8 g r e4
 b8 | % 46
 r8 e4 b8 r e4 g8 | % 47
 \Coda
 f4 c8
 a  r g4 f8~
 f4. c'8 ~ c4 e \break
 \Coda
 \improvisationOn b1~ b
}

Guitar = \relative c'' {
  \clef "treble_8" \key f \major \time 2/2
  s1*4 \break
    \doubleMark
  \markup 4X
  \markup \bold \box A

  s1*4
    \break
  \doubleMark
  \markup 4X
  \markup \bold \box B
   g'4\2  c8\1 bes\2 r a4\2 g8\2 | % 34
 r8 c4 e,8\3 r f4\3 g8\3 | % 35
 f4\3 bes8\2 f\3 r d4\4 bes8\5 | % 36
 r8 bes'4\2 d,8\4 r f4\2 g8\2 | \break
 e4\3 a8\2 g\3 r e4\3 c8\4 | % 38
 r8 e4\3 c8\4 r e4\3 g8\3 | % 39
 es4\4 c8\4 bes\5 r as4\5 es8\6 ~ |
 es4.\6 c'8\4 ~ c4\4 es\4 | \break
 g4\3 c8\2 bes\2 r a4\2 g8\3 | % 42
 r8 c4\2 e,8\3 r f4\3 g8\3 | % 43
 f4\3 a8\2 f\3 r d4\4 a8\5 | % 44
 r8 a'4\2 d,8\4 r e4\3 f8\3 | \break
 e4\3 b'8\2 g\3 r e4\3 b8\4 | % 46
 r8 e4\3 b8\4 r e4\3 g8\3 | % 47
 \Coda
 f4\3 c8\4 a\5  r g4\5 f8~\5 |
 f4.\5 c'8~\4 c4\4 e\3 \break
 \Coda
  s1 s
}

Frets = \relative c {
  \override FretBoard.fret-diagram-details.number-type = #'circled
  \override FretBoard.fret-diagram-details.label-dir = #LEFT
  \override FretBoard.fret-diagram-details.fret-label-font-mag = #0.5
  \override FretBoard.fret-diagram-details.finger-code = #'none
  \override FretBoard.fret-diagram-details.barre-type = #'straight
  s1*4
  <e-2 bes'-3 c-1 g'-4>1 <d bes'-2 d-3 f-1>
  <e-2 bes'-3 c-1 g'-4> <d bes'-2 d-3 f-1>
}

Basse = \relative c' {
  \clef "bass" \key f \major \time 2/2
  \showStartRepeatBar \bar "[|:"
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \bold \box Intro \fontsize #-2 "(Drumset starts 3rd X)" }
  \repeat volta 2
  { c4. g8 ~ g4 c | % 2
    bes1 | % 3
    c4. g8 ~ g4 c | % 4
    bes4 a g c, | % 5 }
  }
  \break
  \doubleMark
  \markup 4X
  \markup \bold \box A
  \repeat volta 2
  { c'4. g8 ~ g4 c | % 2
    bes1 | % 3
    c4. g8 ~ g4 c | % 4
    bes4 a g c, | % 5 }
  }
  \break
  \doubleMark
  \markup 4X
  \markup \bold \box B
  c'4. g8 ~ g4 g | % 34
  c4. e8 ~ e2 | % 35
  bes4. d8 ~ d4 d | % 36
  f4. d8 ~ d2 | \break
  a4. c8 ~ c4 a | % 38
  a4. c8 ~ c2 | % 39
  as4. c8 ~ c4 es |
  as4. c,8 ~ c4 c | \break
  c4. g8 ~ g4 c | % 42
  c4. g8 ~ g2 | % 43
  d'4. a8 ~ a4 d | % 44
  d4. a8 ~ a2 | \break
  e'4. b8 ~ b4 g | % 46
  e4. g8 ~ g4 b | % 47
  f4. a8 ~ a4 c |
  f4. c8 ~ c4 f,
  c'1~ c
}

WoodBlock = \drummode {
  \time 2/2
  r2 wbh2 | r2 wbh4 wbh4 | r2 wbh2 |
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \once \override Score.RehearsalMark.extra-offset = #'(3 . 0)
  \mark \markup \fontsize #-2 " (Woodblock continues simile)"
  r2 wbh4 wbh4 |
}

grille = \chordmode {
  \bar "[|:"
  c1:7 bes c:7 bes \break \bar ":|]"
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible

  \mark \markup 4X

  \repeat percent 2 c1:7 \repeat percent 2 bes \break
  \repeat percent 2 a:m7 \repeat percent 2 as:7 \break
  \repeat percent 2 c:7 \repeat percent 2d:m7 \break
  \repeat percent 2 e:m7 \repeat percent 2 f:7+
  \bar ".." }

marques = \relative c' {
  s1 ^\markup \bold \box \fontsize #5 A s1*3
  s1 ^\markup \bold \box \fontsize #5 B
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  \header { meter = \CleSol }
  \bookpart {
    \score {
      <<
        \new StaffGroup <<
          \new ChordNames { \harmonies }
          \new Staff \with { instrumentName = Soprano } \theNotes
          \new Staff \with { instrumentName = Tenor \RemoveEmptyStaves } \Tenor
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab")
  \header { meter = \Bb }
  \bookpart {
    \score {
      <<
        \new StaffGroup <<
          \new ChordNames { \transpose c d \harmonies }
          \new Staff \with { instrumentName = Soprano } \transpose c d \theNotes
          \new Staff \with { instrumentName = Tenor \RemoveEmptyStaves } \transpose c d \Tenor
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  \header { meter = \Eb }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new StaffGroup <<
          \new ChordNames { \transpose c a \harmonies }
          \new Staff \with { instrumentName = Soprano } \transpose c a, \theNotes
          \new Staff \with { instrumentName = Tenor \RemoveEmptyStaves } \transpose c a, \Tenor
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  \header { meter = \CleSol }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new StaffGroup <<
          \new ChordNames { \harmonies }
          \new Staff \with { instrumentName = Soprano } \theNotes
          \new Staff \with { instrumentName = Tenor \RemoveEmptyStaves } \Tenor
      >> >>
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
  \header { meter = \Bb }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = Soprano } \transpose c d \theNotes
        \new Staff \with { instrumentName = Tenor \RemoveEmptyStaves } \transpose c d \Tenor
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
  \header { meter = \Eb }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = Soprano } \transpose c a, \theNotes
        \new Staff \with { instrumentName = Tenor \RemoveEmptyStaves } \transpose c a, \Tenor
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
    ragged-last = ##t
  }
  \header { meter = \CleSol }
  #(define output-suffix "RSa4")
  \bookpart {
    \score {
      <<
        \new StaffGroup <<
          \new ChordNames { \harmoniesR }
          \new FretBoards
          \with {
            \RemoveEmptyStaves
            \override VerticalAxisGroup #'remove-first = ##t
          }
          \Frets
          \new Staff \with { instrumentName = Guitar } \chordsRhythm
          \new Staff \with { instrumentName = Bass } \Basse
          \new DrumStaff \with{
            drumStyleTable = #percussion-style
            \override StaffSymbol.line-count = #1
            instrumentName = WoodBlock
          }
          \WoodBlock
      >> >>
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
    #(set-paper-size "tablette")
    ragged-bottom = ##t
    ragged-last = ##t
    %page-count = #2
  }
  \header { meter = \CleSol }
  #(define output-suffix "RSTab")
  \bookpart {
    \score {
      <<
        \new StaffGroup <<
          \new ChordNames { \harmoniesR }
          \new FretBoards
          \with {
            \RemoveEmptyStaves
            \override VerticalAxisGroup #'remove-first = ##t
          }
          \Frets
          \new Staff \with { instrumentName = Guitar } \chordsRhythm
          \new Staff \with { instrumentName = Bass } \Basse
          \new DrumStaff \with{
            drumStyleTable = #percussion-style
            \override StaffSymbol.line-count = #1
            instrumentName = WoodBlock
          }
          \WoodBlock
      >> >>
}}}

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    ragged-last = ##t
  }
  \header { meter = \CleSol }
  #(define output-suffix "Guitara4")
  \bookpart {
    \score {
      <<
        \new StaffGroup <<
          \new ChordNames { \harmoniesR }
          \new FretBoards
          \with {
            \RemoveEmptyStaves
            \override VerticalAxisGroup #'remove-first = ##t
          }
          \Frets
          \new Staff \with { instrumentName = Guitar } \chordsRhythm
          \new TabStaff \transpose c c, \Guitar
          \new DrumStaff \with{
            drumStyleTable = #percussion-style
            \override StaffSymbol.line-count = #1
            instrumentName = WoodBlock
          }
          \WoodBlock
      >> >>
} } }