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
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Nothing Personal"
composer = #"Don Grolnick"
meter = #"(Bright Swing)"
kwtempo = #"Fast"
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
  asplayed = #"Michael Brecker" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=FnZc-wekyFc"
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
  \set chordChanges = ##t
g1*4:m g:m c:7 g1*3:m \startParenthesis \parenthesize f2:7 \endParenthesis \parenthesize  e:7 es1*2:7 d:7 g1*3:m
}
IntroH = \chordmode {
  \set chordChanges = ##t
g1:m
}

IntroB =  \relative c {
  \clef "bass" \key bes \major \time 4/4
  \override TextSpanner.bound-details.left.text = "(piano fills)"
  \Intro
  \showStartRepeatBar \bar "[|:"
  g1 _\markup \italic (bs.) \startTextSpan f2 fis2 g1 f2 fis2 \stopTextSpan \bar ":|]"
}


Basse =  \relative c {
  \clef "bass" \key bes \major \time 4/4
  g1 f2 fis2 g1 f2 fis2 g1 f2 fis2 g1 a2 bes
  c1 a2 bes c1 f,2 fis2 g1 f2 fis2 g1 f'2 e 
  \override Rest.stencil = #ly:percent-repeat-item-interface::beat-slash
  \override Rest.thickness = #0.48
  \override Rest.slope = #1.7
  \override TextSpanner.bound-details.left.text = "(bs. walks in 4)"
  \textSpannerDown
  r4 \startTextSpan \repeat unfold 14 {r}  r \stopTextSpan
  g,1 f2 fis2 g1 f2 fis2 \bar ":|]"
}

theNotes =  \relative c'' {
  \clef "treble" \key bes \major \time 4/4
  \showStartRepeatBar \bar "[|:"
r4. bes8 d bes g d | r g fis4-. r4. d16 fis |
e4. e8 r2 | R1 | \break
r2 d4 bes'8 d, | e4 bes'8 e, r2 |
r8 d e fis g es f g |
as \parenthesize fis! bes \parenthesize fis c' \parenthesize fis, \override NoteHead.style = #'cross fis''4-^
 \break
R1 | R1 | r8 fis-^r4 r2 | R1 \revert NoteHead.style 
r2 d,,4 bes'8 d, | e4 bes'8 e, r4. bes'8 | 
fis4 bes8 fis r2 |  r8 \once \override NoteHead.style = #'cross fis''-^r4 r2 \break
  \override Rest.stencil = #ly:percent-repeat-item-interface::beat-slash
  \override Rest.thickness = #0.48
  \override Rest.slope = #1.7
  \override TextSpanner.bound-details.left.text = "(piano fills)"
  r4 \startTextSpan \repeat unfold 14 {r}  r \stopTextSpan
   \override TextSpanner.bound-details.left.text = "(bs. & dr. only or solo break)"
  r4 \startTextSpan \repeat unfold 14 {r}  r \stopTextSpan
 \bar ":|]"
  
}

grille = \chordmode {
  \bar "[|:"
 \repeat percent 4 g1:m \break
 \repeat percent 4 g1:m \break
 \repeat percent 4 c1:7 \break
 \repeat percent 3 g1:m \/f2:7 e:7 \break
 \repeat percent 2 es1:7 \repeat percent 2 d:7 \break
 \repeat percent 4 g1:m 
  \bar ":|]" }

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
    \score { <<
      \new ChordNames \IntroH
      \new Staff \IntroB
    >> }
    \score {
      <<
        \new ChordNames \harmonies 
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
    \score { <<
      \new ChordNames \IntroH
      \new Staff \IntroB
    >> }
    \score {
      <<
        \new ChordNames {
           \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb } <<
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
    \score { <<
      \new ChordNames \IntroH
      \new Staff \IntroB
    >> }
    \score {
      <<
        \new ChordNames {
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb } <<
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
    \score { <<
      \new ChordNames \IntroH
      \new Staff \IntroB
    >> }
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          \new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
      >> 
      \new Staff \Basse
      >>
      %   }   \markup \pad-markup #2 " "
  } }  \bookpart {
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
    \score { <<
      \new ChordNames \IntroH
      \new Staff \IntroB
    >> }
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
      >> >>
      %   }   \markup \pad-markup #2 " "
  } }  \bookpart {
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
    \score { <<
      \new ChordNames \IntroH
      \new Staff \IntroB
    >> }
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a \theNotes
      >> >>
      %   }   \markup \pad-markup #2 " "
  } }  \bookpart {
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
