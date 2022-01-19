
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
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"You'd Be So Nice To Come Home To"
composer = #"Cole Porter"
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
  \set chordChanges = ##f
  s4. a1:m6 b2:m5-7 e:9- a1*2:m6 g1:m7 c:7 f1*2:7+ b1:m5-7 e:7 b2:m5-7 e:9- a1:m6
  fis:m5-7 b:9- b:m5-7 e:9- 
  a1:m6 b2:m5-7 e:9- a1*2:m6 g1:m7 c:7 f1*2:7+ 
  fis2:m5-7 b:9- e1:m7 b2:m5-7 e:9- a1:m6 d2:9 as:9 g:5+9- g2:9- c1:6
  \startParenthesis \parenthesize b2:m5-7 \endParenthesis \parenthesize e:9-
}


theNotes =  \relative c'' {
  \clef "treble" \key c \major \time 4/4 \oneVoice
  \partial 8*3 a8 b c~ \bar ".|" \A
  c1 | b2 a4-. gis8 a~ | a4. e8~ e2~ | e r8 dis e a~ | 
  a1 | g2 e8 d r c~ | c1 | r2 r8 d e f~ 
  f2. dis8 e~ | e2 gis8 b r d~ | d2. b8 c~ | c2 c8 d dis e~
  e2 c4. dis8~ | dis2 ~ dis8 c b b~ | b1~ | b2 r8 a b c~ \bar "||" \break
  \B c1 | b2 a4-. gis8 a~ | a4. e8~ e2~ | e r8 dis e g | 
  a4 c8 a~ a2 | g e8 c r d~ | d1~ | d2 e4-. f-. |
  a2.~ a8 g~ | g2~ g8 a b d~ | d2. c8 a~
  a2 c4-. d-. | e4. es8~ es2~ | es d2 | c4-. r2.| R1 \bar ".."
  \bar ".."
}

grille = \chordmode {
  a1:m6 \/b2:m5-7 e:9- \repeat percent 2 a1:m6 \break
  g:m7 c:7 \repeat percent 2 f:7+ \break
  b:m5-7 e:7 \/b2:m5-7 e:9- a1:m6 \break
  fis:m5-7 b:9- b:m5-7 e:9- \break 
  a1:m6 \/b2:m5-7 e:9- \repeat percent 2 a1:m6 \break
  g:m7 c:7 \repeat percent 2 f:7+ \break
  \/fis2:m5-7 b:9- e1:m7 \/b2:m5-7 e:9- a1:m6 \break
  \/d2:9 as:9 \/g:5+9- g:9- c1:6 \/b2:m5-7 e:9-
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*15
  s1 ^\markup \bold \box \fontsize #7 B 
}
verse = \lyricmode {
  You'd be so __  nice to come home __  to __
  You'd be so __ nice by the fire __
  While the breeze __ on high __  sang a lul -- la -- by __
  You'd be all that __  I could __ de -- si -- re __

  Un -- der stars __ chilled by the win -- ter __
  Un -- der an Au -- gust moon bur -- ning a -- bove __
  You'd be so __ nice, __ you'd be pa -- ra -- dise __
  To come home to __ and love

 %  Under stars chilled by the winter
%   Under an August moon burning above
%   You'd be so nice, you'd be paradise
%   To come home to and love
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
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
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
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes \\ { s4. \repeat unfold 2 { s1*6 \break } \repeat unfold 4 { s1*4 \break } }
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
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a \theNotes
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
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
          \addlyrics \verse
          \\ { s4. \repeat unfold 7 { s1*4 \break } }
      >> >>
  } } \bookpart {
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
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
          \addlyrics \verse
          \\ { s4. \repeat unfold 7 { s1*4 \break } }
      >> >>
  } } \bookpart {
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
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a \theNotes
          \addlyrics \verse
          \\ { s4. \repeat unfold 7 { s1*4 \break } }
      >> >>
  } } \bookpart {
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