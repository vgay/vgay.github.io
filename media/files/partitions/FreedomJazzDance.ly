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

title = #"Freedom Jazz Dance"
composer = #"Eddie Harris"
meter = #"(Fast Funky Rock)"
kwtempo = #"Fast"
kwstyle = #"Funky Rock"

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
  asplayed = #"Eddie Harris" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=NgxNwh5vI50"
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
s4 r2 \parenthesize bes:7 s2. bes4:7 s1*2
r2 \parenthesize bes:7 s2. bes4:7 s1*2
f2:m11 fis:m11 g:m11 as:m11 c4.:m/f bes2/f f8:7 s2 bes
bes1:9+
}


theNotes =  \relative c' {
  \clef "treble" \key bes \major \time 4/4
  \override Rest #'staff-position = #0
  \stemNeutral
    \partial 4 f8 bes
    \repeat volta 2 { 
      es g c, f d bes f d | 
      bes' es as, des bes4-. \stemDown \startParenthesis \parenthesize e,~ | 
      \endParenthesis \parenthesize e1 |
      R1 \break \stemNeutral
      r8 bes' f' c des as es' bes |
      des as es bes f'4-. r | R1 | r2 r4. es8 | \break
      as es bes' es cis fis, b e | d g, c f, bes ces ges des |
      c f bes f es as des f | \tuplet 3/2 { g f des } bes as bes4-. r | \break
      \stemDown
      r2 \startParenthesis \parenthesize bes,8 bes r4 | bes4. bes8 r4 des' | 
      r2 bes,8 bes r4 |
      bes4. \endParenthesis \parenthesize  bes8 r4 \startParenthesis \parenthesize f'8  \endParenthesis \parenthesize bes
   }
}

Basse = \relative c {
  \stemDown
  \override Rest #'staff-position = #0
  \clef "bass" \key bes \major \time 4/4
  \partial 4 \startParenthesis \parenthesize f8
  _\markup { "(basse optionelle, sinon jouer sur B" \override #'(font-encoding . fetaMusic) \flat "7)" }
  bes
  es g c, f d bes f d | 
  bes' es as, des \endParenthesis \parenthesize  bes4-. bes,~ | bes bes-. bes8 bes r4 | bes4. bes8 r2 |
      r8 bes' f' c des as es' bes |
      des as es bes f'4-.
      bes,~ | bes bes-. bes8 bes r4 | bes4. bes8 r4. es8 | 
      as es bes' es cis fis, b e | d g, c f, bes ces ges des |
      c f bes f es as des f | \tuplet 3/2 { g f des } bes as bes4-.
      bes,~ | bes bes-. bes8 bes r4 | bes4. bes8 r4 bes~ | bes bes-. bes8 bes r4 | bes4. bes8 r4 \startParenthesis \parenthesize f'8  \endParenthesis \parenthesize bes
}

chordsRhythm = \relative c''' {
\override Rest #'staff-position = #6
  \improvisationOn \override NoteHead.no-ledgers = ##t 
  \stemUp
\partial 4  
s4 s1 s2. b4~ | b2 b8 b s4 b4. b8 s2
s1 s2. b4~ | b2 b8 b s4 b4. b8 s2
s1*3 s2. b4~ 
b2 b8 b s4 | b4. b8 s4 b~ | b2 b8 b s4 | b4. b8 s2

    \improvisationOff }


grille = \chordmode {
 
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*7 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A
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
        \new Staff \with { instrumentName = \CleSol } <<
            \theNotes \\ \chordsRhythm
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
        \new Staff \with { instrumentName = \Bb } <<
            \transpose c d \theNotes \\ \chordsRhythm
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
        \new Staff \with { instrumentName = \Eb } <<
            \transpose c a, \theNotes \\ \chordsRhythm
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
        \new Staff \with { instrumentName = \CleSol }  <<
        \theNotes  >>
       \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { \consists "Merge_rests_engraver" } << \Basse \\ \transpose b e, \chordsRhythm >>
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
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Bb } <<
            \transpose c d \theNotes \\ \chordsRhythm
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
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb } <<
            \transpose c a, \theNotes \\ \chordsRhythm
      >> >>
} } }