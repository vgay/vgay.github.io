
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

title = #"Witchcraft"
composer = #"Cy Coleman"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Swing"

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
  f1*2:7+ as:dim g1:m c:7 f:7+ c2:m f:7
  bes1*2:7+ bes:m d1:m5-7 g:9+ c:7 g2:m c:7
  f1*2:7+ g1:m c:7 f1*2:7+ b1:m5-7 e:9+
  a:m a:m5+ a:m6 a:m5+ g:m g:m5+ g:m c:7
  f1*2:7+ as:dim g1:m c:7 f1:6
  \startParenthesis \parenthesize g2:m \endParenthesis \parenthesize c:7
}


theNotes =  \relative c' {
  \clef "treble" \key f \major \time 4/4 \oneVoice
  \A r8 d4. d4 e | e8 f4 f8 ~ f2 | r8 d4. d4 e | e8 f4 f8 ~ f2 |
  r8 d4. d4 e | e8 f4 f8 ~ f4 e | e4. d8 ~ d2 ~ | d1 \bar "||" \break
  r8 f4. f4 g | g a8 a ~ a as g4 | r8 f4. f4 g | g as8 as ~ as g ges4 |
  r8 f4. f4 g | g as8 as ~ as g f4 | e1 ~ | e4. c8 ~ c4 d 
  \bar "||" \break
  \B c'4. g8 ~ g2 | r4. c,8 ~ c4 d | c'4. g8 ~ g2 | r4. c,8 ~ c4 d |
  c'4. g8 ~ g4 c4 ~ | c8 g4. \times 2/3 { f4 a c } | d1 ~ d \bar "||" \break
  r8 c4. c4 b | b a8 a ~ a gis a4 | r8 c4. c4 b | b a8 a ~ a gis a4 | 
  r8 bes!4. bes4 a | a g8 g ~ g fis g4 | bes1 ~ | bes1 \bar "||" \break
  \C r8 d,4. d4 e | e8 f4 f8 ~ f2 | r8 d4. d4 e | e8 f4 f8 ~ f2 |
  r8 d4. d4 e | e8 f4 d'8 ~ d4 e, | f1 ~ | f
}

grille = \chordmode {
  \repeat percent 2 f1:7+ \repeat percent 2 as:dim \break
  g:m c:7 f:7+ \/ c2:m f:7 \startStaff \break
  \repeat percent 2 bes1:7+ \repeat percent 2 bes:m \break
  d:m5-7 g:9+ c:7 \/ g2:m c:7 \startStaff \break
  \repeat percent 2 f1:7+ g:m c:7 \break
  \repeat percent 2  f:7+ b:m5-7 e:9+ \break
  a:m a:m5+ a:m6 a:m5+ \break
  g:m g:m5+ g:m6 c:7 \break
  \repeat percent 2 f1:7+ \repeat percent 2 as:dim \break
  g:m c:7 f:6 \/ c2:m f:7 
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*15 
  s1 ^\markup \bold \box \fontsize #7 B s1*15 
  s1 ^\markup \bold \box \fontsize #7 C
}

verse = \lyricmode {
  Those fin -- gers in my hair
  That sly come -- hi -- ther stare
  That strips my cons -- cience bare
  It's witch -- craft __

  And I've got no de -- fense for it
  The heat is too in-- tense for it
  What good would com -- mon sense for it do? __

  'Cause it's witch -- craft
  Wic -- ked witch -- craft
  And al -- though, I know, it's stri -- ctly ta -- boo __

  When you a -- rouse the need in me
  My heart says yes in -- deed in me
  Pro -- ceed with what you're lea -- ding me to __

  It's such an an -- cient pitch
  But one I woul -- dn't switch
  'Cause there's no ni -- cer witch than you __

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
          \theNotes \addlyrics \verse \\ { \repeat unfold 9 { s1*4 \break  } }
      >> >>
    } 
  } \bookpart {
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
          \transpose c d \theNotes
          \addlyrics \verse
          \\ { \repeat unfold 9 { s1*4 \break  } }
      >> >>
    } 
  } \bookpart {
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
          \transpose c a \theNotes
          \addlyrics \verse
          \\ { \repeat unfold 9 { s1*4 \break  } }
      >> >>
    } 
  } \bookpart {
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