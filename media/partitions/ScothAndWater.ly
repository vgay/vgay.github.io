
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

title = #"Scoth and Water"
composer = #"Joe Zawinul"
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
  asplayed = #"Cannonball Adderley" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=Qw2XFtMfOPA"
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
    \override Glissando #'style = #'zigzag
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  s2 c1*4:7 f1:7 \parenthesize fis:dim c1*2:7 d1:m7 g:7 c:7 d2:m7 g:7 c1:7
  c1*4:7+11+ c1*4:7+11+
  c1*4:7 f1:7 \parenthesize fis:dim c1*2:7 d1:m7 g:7 c:7
  \startParenthesis \parenthesize d2:7 \endParenthesis \parenthesize g:7
}

forme = \relative c'' {
  \partial 2 s2
  s1*4 \break s1*4 \break s1*5 \break s1*4 \break
  s1*4 \break s1*4 \break s1*4 \break s1*4 \break
}

theNotes =  \relative c'' {
  \clef "treble" \key f \major \time 4/4
  \partial 2 r8 c r e
  \repeat volta 2 {
    \A
    r2 r8 g, r c | r2 r4. c8(
    fis g dis e g, a4-. c8-.) | r2 r8 c r es-> ~
    es2. \glissando g,8( f ~ | f2.) r8 c'( |
    fis g dis e g, a4-. c8-.) 
    r4 f,8( g e g e' f-> ~ | f2. e8 d ~
    d2.) r8 g-> ~ | g4 dis8( e g, a4-.) c8
  }
  \alternative {
    { r2 r8 c r e }
    { R1 } }
  \bar "||" \break
  \B
  r4 e8( a fis4 d8 a | e' a) r fis ~ fis2 
  r2 a,8( d b a | d4-- b8 a ~ a2) \break
  r4 e'8( a fis4 d8 a | e' a) r fis ~ fis2 
  a,8( d b a d4 b8 a) | r2 r8 c r e \break
  \bar "||" \A
  r2 r8 g, r c | r2 r4. c8(
  fis g dis e g, a4-. c8-.) | r2 r8 c r es-> ~
  es2. \glissando g,8( f ~ | f2.) r8 c'( fis g dis e g, a4-. c8-.) 
  r4 f,8( g e g e' f-> ~ | f2. e8 d ~
  d2.) r8 g-> ~ | g4 dis8( e g, a4-.) c8  
  R1 
  \bar "|."
}

grille = \chordmode {
  \bar "[|:"
 \repeat percent 4 c1:7 \break
 f:7 fis:dim7 \repeat percent 2 c:7 \break
 d:m7 g:7 c:7 
 \set Score.repeatCommands = #'((volta "1"))
 \s d2:m7 g2:7   \set Score.repeatCommands = #'((volta #f) end-repeat) 
 \break \stopStaff 
 s1 \bar "" s1 \bar "" s1 \startStaff 
 \set Score.repeatCommands = #'((volta "2"))
 c1:7   \set Score.repeatCommands = #'((volta #f)) 
 \bar "||" \break
 \repeat percent 4 c:7+11+ \break
 \repeat percent 4 c:7+11+ \break \bar "||"
  \repeat percent 4 c1:7 \break
 f:7 fis:dim7 \repeat percent 2 c:7 \break
 d:m7 g:7 c:7 \/d2:m7 g:7
 \bar ".." }

marques = \relative c' { 
  s1  ^\markup \bold \box \fontsize #7 A s1*15 
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
          \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes \\ \forme
      >> >>
      %   }   
      %   \markup \pad-markup #2 " "
  } }
  \bookpart {
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
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes
      >> >>
      %   }   
      %   \markup \pad-markup #2 " "
  } }
  \bookpart {
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
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
          \new Voice  \transpose c a \theNotes
      >> >>
      %   }   
      %   \markup \pad-markup #2 " "
  } }
  \bookpart {
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