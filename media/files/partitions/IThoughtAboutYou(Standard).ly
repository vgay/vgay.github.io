
\version "2.22.0"
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

title = #"I Thought About You"
composer = #"J. Van Heusen and J. Mercer"
meter = #"(Mod. Ballad)"
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
verseI = \lyricmode {
I took a trip on the train and I thought a __ bout you
I passed a sha __ do __ wy lane and I thought a __ bout you \skip 1
Two or three cars parked un __ der the stars
A win __ ding stream
Moon shi __ ning down on some lit __ tle town
And with each beam, same old dream
}

verseII = \lyricmode {
At ev' __ ry stop that we made, oh, I thought a __ bout you
But when I pulled down the shade, then I real __ ly felt blue
I \repeat unfold 29 { \skip 1 }
peeked through the crack and looked at the track
The one go __ ing back to you, and what did I do?
I'll leave it to you, oh what did I do?
I thought about you
}


harmonies = \chordmode {
  \set chordChanges = ##f
b2:m5-7 bes:9.11+ a:7 d:5+7 g:9 as:13 g1:9
g:m7 e2:m5-7 a:7 d:m7 des:7 c:m7 f:7
bes1:7+ bes:m7 es:13 f2:7+ c:7 f1:7+
b2:m5-7 e4:5+7 e:7 b2:m5-7 e4:5+7 e:7 a:m7 as:7 g:m7 c:7

bes1:7+ bes2:m7 es:13 f2:7+ d:m7/c b2:m5-7 bes:9.11+ 
a:m7 as:7 g:m7 c:7 f1:6 \startParenthesis \parenthesize g2:m7 \endParenthesis \parenthesize  c:7
}


theNotes =  \relative c' {
  \clef "treble" \key f \major \time 4/4
  \repeat volta 2 {
r8 f a c e es d a~ | 2 bes4 a | a8 f f f~ 2 ~ | 2. r4  \break
r8 d f a c b bes a~ | 2 g4 a | g8 ges f f~ 2 ~ | 2. r8 \parenthesize f \break }
\alternative { 
{ d'8 c d c~ 4 bes |   \set Score.repeatCommands = #'((volta #f))
des8 c des c~ 4. bes8 |
a4 c4 2~ | 1 |  \break
e8 f e c~ 4 b | e8 f e c~ 4 b | a4 c8 c~ 2 | f,4 a8 a~ 2 \break }
{ d8 c d c~ 4 bes } }
des8 c des c~ 4. bes8 |
 a8 c d! f~ 4 g | e2. d4 |  \break
 c8 c c c~ 2 | r4 f,4 a8 a a a~ | 1~ | 2. r4

}


grille = \chordmode {
  \bar "[|:"
 \/b2:m5-7 bes:9.11+ \/a:7 d:5+7 \/g:9 as:13 g1:9 \break
 g:m7 \/e2:m5-7 a:7 \/d:m7 des:7 \/c:m7 f:7 \break
 \set Score.repeatCommands = #'((volta "1")) bes1:7+   \set Score.repeatCommands = #'((volta #f))
 bes:m7 es:13 \/f2:7+ c:7 \break
 f1:7+ \w b2:m5-7 e4:5+7 e:7 \w b2:m5-7 e4:5+7 e:7 \x a:m7 as:7 g:m c:7 \bar ":|]" \break
 \set Score.repeatCommands = #'((volta "2")) bes1:7+   \set Score.repeatCommands = #'((volta #f))
 \/bes2:m7 es:13 \/f:7+ d:m7/c \/b2:m5-7 bes:9.11+ \break
 \/a:m7 as:7 \/g:m7 c:7 f1:6 \/g2:m7 c:7
\bar ".." }

marques = \relative c' { 
  s1 
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
          \transpose c d \theNotes
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
        \addlyrics { \verseI }
        \addlyrics { \verseII }
      >> >>
      %   }   \markup \pad-markup #2 " "
  }
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
        \addlyrics { \verseI }
        \addlyrics { \verseII }
      >> >>
      %   }   \markup \pad-markup #2 " "
  } 
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
        \addlyrics { \verseI }
        \addlyrics { \verseII }
      >> >>
      %   }   \markup \pad-markup #2 " "
  } 
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

%{
convert-ly (GNU LilyPond) 2.22.1  convert-ly: Traitement de «  »...
Conversion en cours : 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}
