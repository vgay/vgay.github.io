\version "2.22.0"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Ces petits riens"
composer = #"Serge Gainsbourg"
meter = #"(Med. Latin - Swing)"
kwtempo = #"Medium"
kwstyle = #"Latin / Swing"
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



\header {
  pdftitle = #title
  pdfauthor = #composer
  title = \realBookTitle
  arranger = "Ar. Vincent Gay"
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
  \override ParenthesesItem.font-size = #4
  s8 g1:m7 d:9- d:dim c:m7+9 d:9- g:m7 cis:dim d:9- cis2:dim d:7 g1:m7
  c2:m7 f:7 bes:6.9 g:m7
  c2:m7 f:7 bes1:6.9
  c2:m7 f:7 bes:6.9 g:m7
  c:m7 d:7 g1:m7
}

harmoniesV = \chordmode {
  \override ParenthesesItem.font-size = #4
  s8 g1:m7 d:9- d:dim c:m7+9 d:9- g:m7 cis:dim d:9-
  g1:m7 d:9- d:dim c:m7+9 d:9- g:m7
  cis2:dim d:7 g1:m7
  c2:m7 f:7 bes:6.9 g:m7
  c2:m7 f:7 bes1:6.9
  c2:m7 f:7 bes:6.9 g:m7
  c:m7 d:7 g1:m7
}

Controle = {

}

global= {
  \set Score.skipBars = ##t
  \time 4/4
  \key bes \major
}

Melodie = \relative c'' {
  \partial 8 d8
  \mark \markup \rounded-box \bold Tango
  \repeat volta 2 {
    es4 \times 2/3  { d8 es8 d8 } es4 \times 2/3  { d8 es8 f8 } | % 3
    es4. d8 d2 | % 4
    d4 \times 2/3  { d8 c8 b8 } d4 r8 d8 ~ | % 5
    \times 2/3  { d8 c8 c8 ~ } c8 b8 c4 r8 c8 | \break % 6
    c8 b8 \times 2/3  { c8 b8 c8 ~ } c8 r8 \times 2/3  { b8 c8 d8 } | % 7
    c8 bes!4 bes8 ~ bes4 r8 bes8 | % 8
  }
  \alternative {
    {
      \times 2/3  { bes8 a8 a8 ~ } a8 e8 \times 2/3  { bes'8 a8 a8 ~ } a8 g8 | % 9
      a2 r4. d8
    }
    {
      \times 2/3  { bes8 a8 a8 ~ } a8 e8 \times 2/3  { a8 bes8 a8 ~ } a8 d,8
    }
  }
  g2 r4 r8 g8 \bar "||" \break
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \rounded-box \bold Swing \small "(Double-time feel)"}
  bes8 bes8 a8 bes8 a4
  \times 2/3  {
    a8 bes8 a8
  }
  | % 13
  d8 d8 d4 r4. d8 | % 14
  es8 es8 es8 es8
  \times 2/3  {
    a,8 a8 a8 ~
  }
  a8 a8 | % 15
  d4 r4 r2  | \break % 16
  bes8 bes a8 bes8 a4
  \times 2/3  {
    bes8 a8 g8
  }
  | % 17
  d'8 d8 d4 r4. d8 | % 18
  es8 es8 es8 c8 a8 a8 bes8 a8 | % 19
  g4 r4 r4. \parenthesize d'8 \bar "|."
}

Happy = \relative c'' {
  \mark \markup \rounded-box \bold "Birthday"
  \partial 8
  f,16 f |
  g8 f4 bes8 a4 r8 f16 f |
  g8 f4 c'8 bes4 r8 f16 f |
  f'8 d4 bes8 g f r8 es'16 es |
  d8 bes4 c8 bes2
}

RightH = \relative c'' {
  \set Staff.instrumentName = piano
  \clef G
  \partial 8 r8
  <bes d f>4. d8 ~ d2 | % 3
  <fis, a c es>4. d'8 ~ d2 | % 4
  <gis, b d f>4. d'8 ~ d2 | % 5
  <g, bes d es>1 | % 6
  <fis a c es>2 <fis a c es>2 | % 7
  <g bes d f>1
  <e g bes>2 <g bes e>2 | % 9
  <fis a c>1
  <e g bes>2 <fis a c>2
  <g bes d f>1
  <es g bes>2 <es a c>2 | % 13
  <d f g c>2 <d f bes>2 | % 14
  <es g bes>2 <es a c>2 | % 15
  <d f g c>2 <f g c d>2 | % 16
  <es g bes>2 <es a c>2 | % 17
  <d f g c>2 <d f bes>2 | % 18
  <es g bes>2 <fis a c>2 | % 19
  <g bes d f>2 r2

}

LeftH = \relative c' {
  \set Staff.instrumentName = basse
  \clef "bass"
  \partial 8 r8
  \mark \markup \rounded-box \bold Tango
  \repeat volta 2 {
    g8( d'4) -. g,8 -. es'4 -> d4 -. | % 3
    fis,8( d'4) -. fis,8 -. es'4 -> d4 -. | % 4
    f,!8( d'4) -. g,8 -. b4 -> d4 -. | % 5
    c8( g4) -. d8 -. c4 -. bes8-> c8 | % 6
    es8( c'4) -. es,8 -. d'4 -> c4 -. | % 7
    d,8( bes'4) -. g8 -. c4 -> bes4 -. }
  \alternative {
    { cis,8( bes'4) -. cis,8 -> g'4 -. cis4 -. | % 9
      d4 -. a8 -> fis8 -. d4 r4 }
    { cis8( bes'4) -. d,8 -. a'4 -> d,4 -.
      g4 d8-> bes8 g2 } } \break
  %   \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  %   \mark \markup { \rounded-box \bold Swing "(Double-time feel)"}
  c8 d es e f g a c | bes a g f g f es d | c es d c f a g f | bes g f d bes4 b
  c8 bes c es f es d c | bes d f fis g a bes b c g es c d a' f ges | g4 d g, r
  \bar ".."
}

VoicingA = \relative c'' {
  \set Staff.instrumentName = "Voicing 1 "
  \partial 8 r8
  \mark \markup \rounded-box \bold Tango
  r4. bes8~ 2 | r4. a8~ 2 |
  r8 b4 as8~ 8 g4 f8 | es1
  r4. fis8~ 2 | r4. g8~ 2 |
  r4. des8 d es e f | fis8 r4. r2 \bar "||" \break
  r4. bes8~ 2 | r4. c8~ 2 |
  r4. b8 d4 f | es r8 es~ 2 |
  r4. fis8~ 2 | r4. g8~ 2 |
  g2 fis | g4-. r2.
  \bar "||" \break
  \mark \markup \rounded-box \bold Swing
  R1 | r4 \tuplet 3/2 { d8 f d } \tuplet 3/2 { bes a g } \tuplet 3/2 { f d bes } |
  c8 r r4 r2 | | r8 f d f g a bes d |
  c r2.. | r8 d f g~ g d \tuplet 3/2 { c bes a } |
  g4 r2. | R1
  \bar "|."
}
VoicingB = \relative c' {
  \clef "treble"
  \set Staff.instrumentName = "Voicing 2 "
  \partial 8 r8
  r4. d8~ 2 | r4. d8~ 2 |
  r8 f4 d8~ 8 b4 8 | c1
  r4. d8~ 2 | r4. d8~ 2 |
  r4. bes8~ 8 c4 cis8 | d8 r4. r2
  r4. d8~ 2 | r4. d8~ 2 |
  r4. d8~ 2 | c4. d8~ 2 |
  r4. d8~ 2 | r4. d8~ 2 |
  des2 d | d4-. r2.
}



\layout {
  \context {
    \Staff \RemoveEmptyStaves
    \override VerticalAxisGroup.remove-first = ##t
  }

  \context {
    \Score
    \remove "Bar_number_engraver"
  }
}


Vocal = \relative c'' {
  \partial 8 d8
  \mark \markup \bold \box \fontsize #2 Tango
  es4 \times 2/3  { d8 es8 d8 } es4 \times 2/3  { d8 es8 f8 } | % 3
  es4. d8 d2 | % 4
  d4 \times 2/3  { d8 c8 b8 } d4 r8 d8 ~ | % 5
  \times 2/3  { d8 c8 c8 ~ } c8 b8 c4 r8 c8 | \break % 6
  c8 b8 \times 2/3  { c8 b8 c8 ~ } c8 r8 \times 2/3  { b8 c8 d8 } | % 7
  c8 bes!4 bes8 ~ bes4 r8 bes8 | % 8
  \times 2/3  { bes8 a8 a8 ~ } a8 e8 \times 2/3  { bes'8 a8 a8 ~ } a8 g8 | % 9
  a2 r4. d8 \break


  es4 \times 2/3  { d8 es8 d8 } es4 \times 2/3  { d8 es8 f8 } | % 3
  es4. d8 d2 \break
  d4 \times 2/3  { d8 c8 b8 } d4 r8 d8 ~ | % 5
  \times 2/3  { d8 c8 c8 ~ } c8 b8 c4 r8 c8 | \break % 6
  c8 b8 \times 2/3  { c8 b8 c8 ~ } c8 r8 \times 2/3  { b8 c8 d8 } | % 7
  c8 bes!4 bes8 ~ bes4 r8 bes8 \break



  \times 2/3  { bes8 a8 a8 ~ } a8 e8 \times 2/3  { a8 bes8 a8 ~ } a8 d,8
  g2 r4 r8 g8 \bar "||" \break
  \Swing
  bes8 bes8 a8 bes8 a4
  \times 2/3  { a8 bes8 a8 }
  | % 13
  d8 d8 d4 r4. d8 | \break
  es8 es8 es8 es8
  \times 2/3  {
    a,8 a8 a8 ~
  }
  a8 a8 | % 15
  d4 r4 r2  | \break % 16
  bes8 bes a8 bes8 a4
  \times 2/3  {
    bes8 a8 g8
  }
  | % 17
  d'8 d8 d4 r4. d8 |\break
  es8 es8 es8 c8 a8 a8 bes8 a8 | % 19
  g4 r4 r4. \parenthesize d'8 \bar "|."

}

verse = \lyricmode {
  Mieux vaut n'pen -- ser à rien
  Que n'pas pen -- ser du tout
  Rien c'est dé -- jà
  Rien c'est dé -- jà beau -- coup
  On se sou -- vient de rien
  Et puisqu' -- on ou -- blie tout
  Rien c'est bien mieux
  Rien c'est bien mieux que tout

  Mieux vaut n'pen -- ser à rien
  Que de pen -- ser à vous
  Ça n'me vaut rien
  Ça n'me vaut rien du tout
  Et Com -- me si de rien
  n'é -- tait je pense à tous
  Ces pe -- tits riens
  Qui me ve -- naient de vous

  Si c'é -- tait trois fois rien
  Trois fois rien en -- tre nous
  É -- vi -- dem -- ment çà ne fait pas beau -- coup
  Ce sont ces petits riens
  Que j'ai mis bout à bout
  Ces pe -- tits riens
  Qui me ve -- naient de vous
}

verseB = \lyricmode {
  Mieux vaut pleu -- rer de rien
  que de ri -- re de tout
  Pleu -- rer pour un rien
  c'est dé -- jà beau -- coup
  Mais vous vous n'a -- vez rien
  dans le cœur et j'a -- voue
  Je vous en -- vie
  Je vous en veux beau -- coup

  Ce sont ces pe -- tits riens
  Qui me ve -- naient de vous
  Les \skip 1 vou -- lez vous?
  Tenez! Que vou -- lez vous?
  Moi je ne veux pour rien
  Au monde plus rien de vous
  Pour être à vous
  Faut être à moi -- tié fou.
}


\book {
  \paper {
    page-count = #1
    ragged-last-bottom = ##t
    #(set-paper-size "a4")
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      \relative c' <<
        \new ChordNames {
          \set chordChanges = ##t
          \transpose c d \harmonies
        }
        \new Staff \with { instrumentName = \Bb } << \transpose c d \global \transpose c d \Melodie >>
      >>
    }
    \markup \bold \fontsize #2 \column { " " "Voicing" }
    \score {
      %\new StaffGroup <<
      \relative c' <<
        \new ChordNames {
          \set chordChanges = ##t
          \transpose c d \harmoniesV
        }
        \new Staff << \transpose c d \global \transpose c d \VoicingA >>
        \new Staff << \transpose c d \global \transpose c d \VoicingB >>
      >>
    } \markup " " } }

\book {
  \paper {
    indent = 1.5 \cm
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \score {
      %\new StaffGroup <<
      \relative c' <<
        \new ChordNames {
          \set chordChanges = ##t
          \transpose c d \harmonies
        }
        \new Staff \with { instrumentName = \Bb } << \transpose c d \global \transpose c d \Melodie >>
      >>
    }
  }
  \bookpart {
    \score {
      %\new StaffGroup <<
      \relative c' <<
        \new ChordNames {
          \set chordChanges = ##t
          \transpose c d \harmoniesV
        }
        \new Staff << \transpose c d \global \transpose c d \VoicingA >>
        \new Staff << \transpose c d \global \transpose c d \VoicingB >>
      >>
    }
  }
}

\book {
  \paper {
    indent = 1.5 \cm
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      %\new StaffGroup <<
      \relative c' <<
        \new ChordNames {
          \set chordChanges = ##t
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb } << \transpose c a \global \transpose c a, \Melodie >>
      >>
    }
  }
  \bookpart {
    \score {
      %\new StaffGroup <<
      \relative c' <<
        \new ChordNames {
          \set chordChanges = ##t
          \transpose c a \harmoniesV
        }
        \new Staff << \transpose c a \global \transpose c a \VoicingA >>
        \new Staff << \transpose c a \global \transpose c a \VoicingB >>
      >>
    }
  }
}

\book {
  #(define output-suffix "Eba4")
  \paper {
    page-count = #1
    ragged-bottom = ##f
    #(set-paper-size "a4")
  }
  \bookpart {
    \header {}
    \score {
      %\new StaffGroup <<
      \relative c' <<
        \new ChordNames {
          \set chordChanges = ##t
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb } << \transpose c a \global \transpose c a, \Melodie >>
      >>
    }
    \markup \bold \fontsize #2 \column { " " "Voicing" }
    \score {
      %\new StaffGroup <<
      \relative c' <<
        \new ChordNames {
          \set chordChanges = ##t
          \transpose c a \harmoniesV
        }
        \new Staff << \transpose c a \global \transpose c a \VoicingA >>
        \new Staff << \transpose c a \global \transpose c a \VoicingB >>
      >>
} } }


\book {
  #(define output-suffix "Ca4")
  \paper {
    page-count = #1
    ragged-bottom = ##f
    #(set-paper-size "a4")
  }
  \bookpart {
    \header {}
    \score {
      \relative c' <<
        \new ChordNames { \set chordChanges = ##t \harmonies }
        \new Staff \with { instrumentName = \CleSol } << \global \Melodie >>
        \new Staff << \global \RightH >>
        \new Staff << \global \LeftH >>
      >>
}}}
\book {
  #(define output-suffix "CTab")
  \paper {
    page-count = #2
    ragged-bottom = ##f
    #(set-paper-size "tablette")
  }
  \bookpart {
    \header {}
    \score {
      \relative c' <<
        \new ChordNames { \set chordChanges = ##t \harmonies }
        \new Staff \with { instrumentName = \CleSol } << \global \Melodie >>
        \new Staff << \global \RightH >>
        \new Staff << \global \LeftH >>
      >>
}}}



\book {
  #(define output-suffix "Vocala4")
  \bookpart {
    \header {}
    \score {
      \relative c' <<
        \new Staff << \global \Vocal >>
        \addlyrics { \verse }
        \addlyrics { \verseB }
      >>
}}}
