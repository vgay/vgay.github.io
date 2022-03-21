\version "2.22.1"
#(set-global-staff-size 18)
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

title = #"African Skies"
composer = #"Michael Brecker"
meter = #"(West African Groove)"
kwtempo = #"Medium"
kwstyle = #"African Groove"

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
  asplayed = #"Michael Brecker" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=QCOAvvumyWg"
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

  s1. \repeat percent 4 { \tweak text \markup \fontsize #-1 { Fm \super 7 " (Phrygian)" } f1.:m7 }

  \repeat unfold 3 { f1.:m7 ces2./ges des2./as  } s4 b2:sus as4.:sus f4.:sus s1.
  bes1.*2:m7 as:11+13 bes:m7 as1.:11+13 e:5+7+.11+
  \repeat unfold 3 { f1.:m7 ces2./ges des2./as  } s4 b2:sus as4.:sus f4.:sus s1.
  as1./c s2. a/cis as1.*2/c
  des2.:6.9 as/c e1.:7+11+ bes2.:m5-7 es:6 a:m5-7  e:5+7+.11+
  des2.:6.9 as/es e:7+11+ f:m7 s8 bes4.:m5-7 es:6 a:m5-7  e4:5+7+.11+ s1.
}


theNotes =  \relative c' {
  \clef "treble" \key as \major \time 12/8 \Intro
  \override Rest #'staff-position = #0
  R1. -\markup drums \repeat volta 2 { R1.*3 | r2. r4. r8 r \once \override TextScript #'extra-offset = #'( -1 . 0 )  c8 ^\markup "2nd X" } \break
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup \small \pad-around #0.5 \concat { "Bass cont. simile till " \box B }
  \markup \box A
  \repeat volta 2 {
    as' c bes~ bes as f c4 es8~ 4. | r2. r4. r8 r bes'8 |
    as c bes~ bes as f c4 es8 f4. | r2. r8 bes, c es f as | \break
    bes c bes~ bes as f c4 \grace { des16 d } es8~ es \grace { d16 des } c4~ | 2. r4. es8 f as |
    \voiceTwo bes c ces~ ces ges es \stemUp c4  as'8  f4. | 2. r4. r8 r \oneVoice c } \break
  \mark \markup { \raise #1.2 \with-color #red \musicglyph "scripts.varsegno" \box B }
  f4 c'8~ c4 es8 bes2. | c,4 f8~ 4 as8 es4 c8 bes4. | f'4 c'8~ c4 es8 as,2. | R1. \break
  f4 c'8~ c4 es8 bes2. | c,4 f8~ 4 as8 es4 c8 bes4. | f'4 c'8~ c4 es8 as,4 8 bes f4 | \voiceTwo r2. r4. r8 r \oneVoice c
  \break \bar "||" \mark #1
  as' c bes~ bes as f c4 es8~ 4. | r2. r4. r8 r bes'8 |
  as c bes~ bes as f c4 es8 f4. | r2. r8 bes, c es f as | \break
  bes c bes~ bes as f c4 \grace { des16 d } es8~ es \grace { d16 des } c4~ | 2. r4. es8 f as |
  \voiceTwo bes c ces~ ces ges es \stemNeutral c4  as'8  f4. | 2. r2. \oneVoice \break \bar "||"
  \mark-y-dir #`( (,left . ,UP) (,right . ,UP) )
  \doubleMark
  \markup {  \with-color #red \musicglyph "scripts.varcoda" }
  \markup \box C

  as4. _\markup "guitar" bes as4 bes8 c4 es8 | as,2. r | as4. bes as4 es8 c4 bes8 | as4 bes8~ 4.~ 4. r | \break
  as'4. bes as4 bes8 c4 es8 | as,4 bes8~ 4.~ 4. r4 as8  _\markup "with Tenor" |
  b4.~ 8 e, c g'4. c,8 f c | es!4.~ 8 c bes as2. \break
  as'4. _\markup "guitar" bes as4 bes8 c4 es8 | as,4. ~ 8 bes c bes2. |
  \voiceTwo  as8 _\markup "with Tenor" ces4 \stemNeutral e,8  g4 es8 g4 c,8 es4~ | 1.
  \bar "||" \pageBreak
}

chordsRhythm = \relative c''' {
  \override Rest #'staff-position = #8
  \improvisationOn \override NoteHead.no-ledgers = ##t
  \voiceOne s1.*11 r4  d8~ 4. 4. 4.~ 1. s1.*7 r4  8~ 4.~ 2.
  s1.*6 r4  d8~ 4. 4. 4.~ 1. s1.*10
  r8 4 r8 4 r8 4 r8 4~ 1.

}

voltaAdLib = \markup \small { \text "Vamp Till Cue" }
voltaOnCue = \markup \small \text "On Cue"

TheCoda = \relative c'' {

  \clef "treble" \key as \major \time 12/8
  \improvisationOn \Coda \override Stem #'transparent = ##t
  \repeat volta 2 {
    \repeat percent 3 { bes 4. 4. 4. 4.  }   }
  \alternative {
    {
      \overrideProperty Score.VoltaBracket.text \voltaAdLib
      \override MultiMeasureRest.thickness = 0.48
      \override MultiMeasureRest #'stencil = #ly:multi-measure-rest::percent R1.}
    {
      \overrideProperty Score.VoltaBracket.text \voltaOnCue
      bes1. \fermata }
  }
  \bar ".."
  \label #'theLastPage
}
CodaChords = \chordmode { f1:m7 }

Basse = \relative c, {
  \clef "bass" \key as \major \time 12/8

  R1.
  %\once \override Score.RehearsalMark.extra-offset = #'(11.5 . -3.7) \mark \markup \small (Phrygian)
  \repeat percent 4 { f4 bes8 c4 es8 f4. es8 as f }

}

grille = \chordmode {
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \Solos
  \bar "[|:"
  \repeat percent 4 { f1:m7 } \break
  \repeat percent 2 { c:8 } \repeat percent 2 { f1:m7 }  \break
  \repeat percent 2 { bes:m7 } \repeat percent 2 { as:11+13 } \break
  \repeat percent 2 { bes:m7 } as:11+13 c:8  \break
  \repeat percent 4 { f1:m7 } \break
  \repeat percent 2 { c:8 } \repeat percent 2 { f1:m7 }
  \bar ":|]"
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup \with-color # red \pad-around #0.5 "After solos D.S. al Coda"
}



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
        \new Staff \with { instrumentName = \CleSol } <<
          \new Voice  \chordsRhythm
          \new Voice \theNotes
        >>
      >>
    }
    \score {
      \gridLayout
      \new ChordGrid \grille
    }
    \score {
      \layout { indent = 0 }
      <<
        \new ChordNames { \CodaChords }
        \new Staff \TheCoda
      >>
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
        \new Staff \with { instrumentName = \Bb } <<
          \new Voice  \chordsRhythm
          \new Voice \transpose c d \theNotes
        >>
      >>
    }
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
    }
    \score {
      \layout { indent = 0 }
      <<
        \new ChordNames { \CodaChords }
        \new Staff \TheCoda
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
        \new Staff \with { instrumentName = \Eb } <<
          \new Voice  \chordsRhythm
          \new Voice \transpose c a \theNotes
        >>
      >>
    }
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
    }
    \score {
      \layout { indent = 0 }
      <<
        \new ChordNames { \CodaChords }
        \new Staff \TheCoda
      >>
    }
} }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          \new Voice  \chordsRhythm
          \new Voice \theNotes
        >>
        \new Staff \Basse
      >>
    } %\form
    %}  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
    }
    \score {
      \layout { indent = 0 }
      <<
        \new ChordNames { \CodaChords }
        \new Staff \TheCoda
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
          \new Voice  \chordsRhythm
          \new Voice \transpose c d \theNotes
        >>
      >>
    } %\form
    %}  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
    }
    \score {
      \layout { indent = 0 }
      <<
        \new ChordNames { \CodaChords }
        \new Staff \TheCoda
>>} } }

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
          \new Voice  \chordsRhythm
          \new Voice \transpose c a \theNotes
        >>
      >>
    }
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
    }
    \score {
      \layout { indent = 0 }
      <<
        \new ChordNames { \CodaChords }
        \new Staff \TheCoda
      >>
} } }

