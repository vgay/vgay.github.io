
\version "2.19.80"
#(set-global-staff-size 18)
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

title = #"But Beautiful"
composer = #"Jimmy Van Heusen"
meter = #"(Med. Ballad)"
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
  asplayed = #"Chet Baker" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=TRm3cZGtt8M"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as sung by " \fromproperty #'header:asplayed ")" }
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
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
  s4 g2:7+9 c:9.11+ b:m5-7 e:9- a1:m7 cis2:5-7 fis:9-
  g2:7+9 c:9.11+ b:m5-7 e:9- a1*2:9
  d2:7sus4 d/c b:m7 e:m11 a:m7 d:9sus4 g1:7+
  e:m7 a2:9sus a:9-13 d1:7sus4 d:9- a:7
  d2:7sus4 d/c b:m7 e:m11 a:m7 fis4:m11 b:9- e2:m7 f:7sus4
  g:7+ bes:7 a:m7 d:9- g:6 \startParenthesis \parenthesize  e:9+ a:m7 \endParenthesis \parenthesize  d:9-
}


theNotes =  \relative c' {
  \clef "treble" \key g \major \time 4/4
  \partial 4 cis8 d
  \repeat volta 2 {
    a'4 a2 g8 fis | f2. dis8 e | b'4 b2 a8 as | g2. fis?8 g \break
    d'4 d2 b8 bes | a2. gis4 | b8 b b2. ~ | }
   \alternative {
     {
    \set Score.voltaSpannerDuration = #(ly:make-moment 4 4)
    b1 \bar "||" \break
    b8 b b2 a4 | d b a4. g8 | c4 a g fis | b2. d,8 dis \break
    e4 e2 g4 | b g fis e | a1 ~ | a2. cis,8 d  \break }
     { b'2. \repeatTie e,8 eis \bar "||"
     }
   }
fis4 fis2 a4 | d b a4. g8 | e'4 c b a | g2. g4 \break
d'8 d d2 g,4 | c8 c c2 fis,4 | g1 ~ | g2. r4
\bar ".."
}

verse = \lyricmode {
Love is fun -- ny, or it's sad
Or it's qui -- et, or it's mad
It's a good thing or it's bad
But beau -- ti -- ful __

Beau -- ti -- ful to take a chance and if you fall you fall
And I'm thin -- king I would -- n't mind at all

Love is \skip 1

And I'm thin -- king if you were mine I'd ne -- ver let you go
And that would be but beau -- ti -- ful I know __
}

verseB = \lyricmode {
 \repeat unfold 2 { \skip 1 } tear -- ful, or it's gay
It's a pro -- blem or it's play
It's a heart -- ache ei -- ther way
But beau -- ti -- ful



% And I'm thinking if you were mine I'd never let you go
% And that would be but beautiful
% 
% That would be but beautiful
% 
% That would be but beautiful I know
}

grille = \chordmode {
  \bar "[|:"
 \/g2:7+9 c:11+ \/b:m5-7 e:9- a1:m7 \/cis2:5-7 fis:9- \break
 \/g2:7+9 c:11+ \/b:m5-7 e:9- a1:9 \set Score.repeatCommands = #'((volta "1"))
 a:9   \set Score.repeatCommands = #'((volta #f)) \break \bar "||"
 \/d2:7sus4 d/c \/b:m7 e:m11 \/a:m7 d:9sus4 g1:7+ \break
 e:m7 \/a2:9 a:9-13 d1:7sus4 d:9- \break \bar ":|]"
 \stopStaff s1 \bar "" s1 \bar "" s1 \startStaff 
 \set Score.repeatCommands = #'((volta "2")) a:7 
 \set Score.repeatCommands = #'((volta #f)) \break \bar "||"
 \/d2:7sus4 d/c \/b:m7 e:m11 \w a:m7 fis4:m11 b:9- \/e2:m7 f:7sus4 \break
 \/g:7+ bes:7 \/a:m7 d:9- \/g:6 e:9+ \/a:m7 d:9- 
  \bar ".." }

marques = \relative c' { 
  
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
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
      >>
    } %\form
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
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
    } %\form
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
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a \theNotes
        >> 
      >>
    } %\form
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
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
          \addlyrics \verse
          \addlyrics \verseB
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
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
          \addlyrics \verse
          \addlyrics \verseB
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
          %\new Voice  
          \transpose c a \theNotes
          \addlyrics \verse
          \addlyrics \verseB
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
        \transpose c a \grille
      >>
} } }