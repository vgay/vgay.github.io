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

title = #"Autumn In New York"
composer = #"Vernon Duke"
meter = #"(Ballad)"
kwtempo = #"Mod. Slow"
kwstyle = #"Ballad"

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
  %asplayed = #""  doit être commentée si vide
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
    voltaSpannerDuration = #(ly:make-moment 4 4)
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

\defineBarLine "||-[|:" #'("||" "[|:" "[|:")

form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  g2:m7 a:m7 g:m7 c:7 f:7+ g:m7 a:m7 d:9-
  g2:m7 a:m7 g:m7 c:7 a1:m5-7 d:7
  g:m7 bes2:m es:7 as:7+ des:7 c:m7 g:9-
  c:m7 es:7 as:7+ g:9- c1.:7+ a4:m7 d:5-7
  g2:m7 a:m7 g:m7 c:7 f:7+ g:m7 a:m7 d4:7 des:7
  c2:m7 d:m7 es:m7 f:7 bes:m6 as:m7 ges1:7
  f2:m7 c:5+7 f4:m7 e:m7 es:m7 as:7 des2:7+ c:5+7 f:m7 as:m7
  g:m7 a:m7 bes:m6 c:9- f1:m
}


theNotes =  \relative c'' {
  \clef "treble" \key f \major \time 4/4
  \oneVoice \voiceOne
  a8 g f d c2 ~ | c8 d f bes d d4 c8 | d2 a | R1
  a8 g f d c2 ~ | c8 d f bes d d4 c8 | d2 a | R1 \bar "||" \break
  c8 c4 a8 g4. f8 | as as4 f8 es4. des8 | es b4 c8 es2 ~ | es f |
  g8 d4 es8 g2 ~ | g b | g1 ~ | g2 r4 gis \bar "||" \break
  a8 g f d c2 ~ | c8 d f bes d d4 c8 | d2 a | R1
  d8 c bes g f2 ~ | f8 ges bes c des es4 c8 | des1 ~ | des2. r4 \bar "||" \break
  c8 as4 c8 e4 e | c2. bes4 | as8 f4 as8 c4 c | as2. as4
  a!8 g f d c2 ~ | c8 bes des f as bes4 g8 | f1 | R
  \bar ".."
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  \partial 8
  \showStartRepeatBar \bar "[|:"


}

Basse = \relative c' {
  \clef "bass" \key f \major \time 4/4
  \partial 8
  \showStartRepeatBar \bar "[|:"

  \bar ".."
}

grille = \chordmode {
  \bar "[|:"

  \bar ".." }

marques = \relative c' {
  s1 ^\markup \bold \box \fontsize #5 A s1*3
  s1 ^\markup \bold \box \fontsize #5 B s1*3
  s1 ^\markup \bold \box \fontsize #5 A
}

verse = \lyricmode {
  Au -- tumn in New York, why does it seem so in -- vi -- ting?
  Au -- tumn in New York, it spells the thrill of first nigh -- ting
  Glit -- te -- ring crowds and shim -- me -- ring clouds in ca -- nyons of steel __
  They're ma -- king me feel: I'm home __

  It's au -- tumn in New York that brings the pro -- mise of new love
  Au -- tumn in New York is of -- ten min -- gled with pain __
  Drea -- mers with emp -- ty hands may sigh for e -- xo -- tic lands;
  It's au -- tumn in New York;
  It's good to live it a -- gain

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
          \new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
    } \form
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
          \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } \form
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
          \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a, \theNotes
        >>
      >>
    } \form
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
          \new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
    } \form
  }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef
          \omit TimeSignature
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
          \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } \form
  }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef
          \omit TimeSignature
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
          \new Voice
          \transpose c a, \theNotes
        >>
      >>
    } \form
  }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef
          \omit TimeSignature
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
  \paper { page-count = #1
           #(set-paper-size "a4")}
  \bookpart {
    #(define output-suffix "Vocala4")
    \score {
      <<
        \new ChordNames {
          \harmonies
        }
        \new Staff
        <<
          \set Staff.instrumentName = \CleSol
          \new Voice = "Mel" { \theNotes \pageBreak }
          \addlyrics \verse
          \\ { \repeat unfold 7 { \voiceTwo s1*4 \break  } }
        >>

      >>

    }

    \markup {
      \vspace #5
      \fill-line {
        \column {
          \line { 2- }
          \line { Autumn in New York, the gleaming rooftops at sundowne }
          \line { Autumn in New York, it lifts you up when you're let down }
          \line { Jaded roués and gay divorces who lunch at the Ritz }
          \line { Will tell you that it's devine }
          \line { It's autumn in New York transforms the slums into Mayfair  }
          \line { Autumn in New York, you'll need no castle in Spain }
          \line { Lovers that bless the dark  On benches in Central Park }
          \line { Greet autumn in New York It's good to live it again   }
        }
      }
    }
} }