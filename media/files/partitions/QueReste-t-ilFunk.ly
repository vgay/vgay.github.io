
\version "2.22.1"
#(set-global-staff-size 18)
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
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Que reste-t-il de nos amours ?"
composer = #"Charles Trenet"
meter = #"(Med. Funk)"
kwtempo = #"Medium"
kwstyle = #"Funk"


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
  arranger = "arr. Vincent Gay"
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
  \context { \Score markFormatter = #format-mark-box-alphabet }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
}}


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
  \set chordChanges = ##f
  s4 es1:m7 s f1:m5-7 bes:9-
  es1:m7 s f1:m5-7 bes:9-
  es1:m7 s f1:m5-7 bes:9-
  es:7+ c2:m5-7 f:7 f1:m7sus4 bes:7
  f:m7 bes:7 es2:7+ as:7 g:m7 ges:dim
  f1:m7 bes:7 es2:7+ as:7 g:m7 c:7
  bes1:7 bes:m7 es:7
  as:7+ as2:m7 des:7 es:6 as:7 g:m7 c:7
  f1:m7 c2:m7 f:7 f1:m7 bes2:7 c:7
  bes1:7 es2:7+ \startParenthesis \parenthesize as:7 g:m7 \endParenthesis \parenthesize c:7
}

harmoniesR = \chordmode {
  \set chordChanges = ##f
  s4 es1:m7 s f1:m5-7 bes:9-
  es:7+ c2:m5-7 f:7 f1:m7sus4 bes:7
  f:m7 bes:7 es2:7+ as:7 g:m7 ges:dim
  f1:m7 bes:7 es2:7+ as:7 g:m7 c:7
  bes1:7 bes:m7 es:7
  as:7+ as2:m7 des:7 es:6 as:7 g:m7 c:7
  f1:m7 c2:m7 f:7 f1:m7 bes2:7 c:7
  f1:m7 bes:7 es2:7+ as:7 g:m7 ges:dim
  f1:m7 bes1:7 es2:7+ \startParenthesis \parenthesize as:7 g:m7 \endParenthesis \parenthesize c:7
}


theNotes =  \relative c' {
  \clef "treble" \key es \major \time 4/4
  \Intro \oneVoice
  \partial 4 bes4 | % 1
  bes'1| % 2
  r4 ces8 bes8 as8 ges8 f8 ges8 | % 3
  as1 | % 4
  r4 bes8 as8 ges8 f8 es8 f8 | % 5
  ges1 | % 6
  r4 as8 ges8 f8 es8 d8 es8 | % 7
  f1 ~ |
  f2 r4 bes,4 | \break
  bes'1 ~ |
  bes4 des8 bes8 as8 ges8 f8 ges8 | % 117f
  as1 | % 12
  r4 b8 as8 ges8 f8 es8 f8 | % 13
  g1 | % 14
  r4 bes8 ges8 f8 es8 d8 es8 | % 15
  bes'1 ~ | % 16
  bes4 r4 \times 2/3 {
    g4 as4 bes4
  } \break
  \repeat volta 3 {
    \A
    g2 f8 g4 f8 | g2 r8  f f bes | f2 es8 f4 es8 |  f2 r8  es es as
    | % 21
    es2 r8 c es c
  }
  \alternative {
    {
      | % 22
      d2 g8 f4 d8 | c2. ~ \tuplet 3/2 { c8 d c } | b4-. r \tuplet 3/2 { g'4 as bes } \break
    }
    {   \set Score.voltaSpannerDuration = #(ly:make-moment 4 4)
        d,2 g4 f4
        f1 ~ | % 27
        f4 r4 \times 2/3 { es4 f4 g4 }
        \bar "||"
        \once \override TextScript #'extra-offset = #'( -4 . 3 ) c2 ^\markup { \box \bold \fontsize #4 "B" } \times 2/3 { c4 c4 c4 }
        ces2 r8 es, f g
        bes2 \times 2/3 { bes4 bes4 bes4}
        bes2 r8 c, d c
        as'2 r8 c, d c
        g'2 \times 2/3 {
          c4 c4 b4
        }
        bes!2. r4 | % 35
        r2 \times 2/3 { g4 as4 bes4}
    }
    {
      | % 36
      d,2 \times 2/3 {
        g4 g4 g4
      }
    }
  }
  es1 | % 38
  r2
  \times 2/3 { \startParenthesis \parenthesize g4 as4 \endParenthesis \parenthesize bes4 }
  \bar "|."
}


Basse = \relative c {
  \clef "bass" \key es \major \time 4/4 \Intro
  \voiceOne

  \partial 4 \once \override Rest #'staff-position = #0 r4
  \repeat volta 2 {
    es8. es bes'8 des8. bes16 des8 es
    es,8. es bes'8 des8. as16 bes des es8
    f,8. f ces'8 es8. c16 es8 f
    bes,,8. bes f'8 as8. d,16 f8 bes \break
  }
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \mark \markup 3x
  es,8. es bes'8 es8. g,16 bes8 es |
  c,8. c g'8 f8. c'16 es8 f16 c |
  f,8. f c'8 es8. c16 es8 f |
  bes,,8. bes f'8 as8. d,16 f8 bes \break
  \repeat volta 2 {
    \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
    \doubleMark
    \markup \smaller \pad-around #1 "Guitar cont. simile"
    \markup \bold \box A
    f8. as c8 es8. c as8 |
    bes,8. bes f'8 as8. d,16 f8 bes |
    es,8. g bes8 as8. es c8 |
    g'8. g d'8 ges,8. a c8 \break
    f,8. as c8 es8. c as8 }
  \alternative
  {
    { bes,8. bes f'8 as8. d,16 f8 bes |
      es,8. g bes8 as8. es c8 |
      g'8. g d'8 c8. g c,8 }
    { bes8. bes f'8 as8. d,16 f8 bes |
      bes,8. des f8 as8. f des8 |
      es8. es bes'8 des8. bes16 des8 es \bar "||" \break \mark #2
    }
  }
  as,8. es c8 as8. es' as8  |
  as8. es ces8 as8. des f8 |
  es8. g bes8 as,8. c es8 |
  g8. bes d8 c,8. e g8 \break
  f8. f c'8 es8. c16 bes8 f |
  c8. c g'8 f8. c16 f8 a |
  f8. as c8 es8. c as8  |
  bes,8. bes f'8 c8. g'16 bes8 c \bar "||" \break \mark #1
  f,8. as c8 es8. c as8 |
  bes,8. bes f'8 as8. d,16 f8 bes |
  es,8. g bes8 as8. es c8 |
  g'8. g d'8 ges,8. a c8 \break
  f,8. as c8 es8. c as8 |
  bes,8. bes f'8 as8. d,16 f8 bes |
  es,8. g bes8 as8. es c8 |
  g'8. g d'8 c8. g c,8
  \bar ".."
}

chordsRhythm = \relative c, {
  \voiceTwo
  \override Rest #'staff-position = #-7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  \once \override TextScript #'extra-offset = #'( -8 . 2 )
  \partial 4 s4 _\markup "(Guitar rhythm)"
  e8. 16~ 4 r4 4 | r4 8. 16~ 4 r4 |  e8. 16~ 4 r4 4 | r4 8. 16~ 4 r4 |
  e8. 16~ 4 r4 4 | e8. 16~ 4 e8. 16~ 4 | e8. 16~ 4 e8. 16~ 4 | e8. 16~ 4 r2




}
grille = \chordmode {
  \bar "[|:"
  \repeat percent 2 { es1:m7 }  f1:m5-7 bes:9- \bar ":|]" \break
  es1:7+ \/ c2:m5-7 f:7 \startStaff f1:m7 bes:7
  \bar "||-[|:" \break
  f1:m7 bes:7 \/ es2:7+ as:7 \/ g:m7 ges:dim \startStaff \break
  f1:m7 bes:7 \set Score.repeatCommands = #'((volta "1")) \/ es2:7+ as:7 \s g:m7 c:7
  \set Score.repeatCommands = #'((volta #f))
  \bar ":|]" \break
  s1 \bar "" s \startStaff \set Score.repeatCommands = #'((volta "2"))
  bes:m7 es:7 \set Score.repeatCommands = #'((volta #f)) \bar "||" \break
  as1:7+ \/ as2:m7 des:7  \/ es:6 as:7  \/ g:m7 c:7 \startStaff \break
  f1:m7  \/ c2:m7 f:7 \startStaff f1:m7 \/ bes2:7 c:7 \startStaff \bar "||" \break

  f1:m7 bes:7 \/ es2:7+ as:7 \/ g:m7 ges:dim \startStaff \break
  f1:m7 bes:7  \/ es2:7+ as:7 \/ g:m7 c:7
  \bar ".." }

marques = \relative c' {
  s1 ^\markup \bold \box \fontsize #5 Intro s1*7
  s1 ^\markup \bold \box \fontsize #5 A s1*11
  s1 ^\markup \bold \box \fontsize #5 B s1*7
  s1 ^\markup \bold \box \fontsize #5 A
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        }
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c a \theNotes
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
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol \consists "Merge_rests_engraver" }
        <<
          \theNotes
          \\ { s4 s1*4 \break s1*8 \break s1*8 \break s1*7 \break   s1*4 \break s1*4 \break}
        >>
      >>
  } }
  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
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
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        }
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes
          \\ { s4 s1*12 \break s1*4 }
      >> >>

  } }
  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
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
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
          \new Voice  \transpose c a \theNotes
          \\ { s4 s1*12 \break s1*4 }
      >> >>
  } }
  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
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
        }
        \transpose c a \grille
      >>
} } }

\book {
  #(define output-suffix "RSa4")
  \paper { %page-count = #1
    #(set-paper-size "a4")
  }
  \bookpart {
    \paper {
      ragged-last-bottom = ##f
      %ragged-last = ##t
    }
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \harmoniesR
        }
        %         \new Staff
        %         <<
        %           \set Staff.instrumentName = "Piano"
        %           \new Voice = "Mel" { \chordsRhythm }
        %         >>
        \new Staff
        <<
          \set Staff.instrumentName = \CleFa
          \new Voice = "Mel" { \clef "bass_8" \Basse }
          \new Voice \chordsRhythm
          %\new Voice = "Ctrl" { \ossature }
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
  #(define output-suffix "RSTab")
  \paper { %page-count = #1
    #(set-paper-size "tablette")
  }
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \harmoniesR
        }
        \new Staff
        <<
          \set Staff.instrumentName = \CleFa
          \new Voice = "Mel" { \clef "bass_8" \Basse }
          \new Voice \chordsRhythm
        >>
      >>
}}}
%{
convert-ly (GNU LilyPond) 2.22.1  convert-ly: Traitement de «  »...
Conversion en cours : 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}
