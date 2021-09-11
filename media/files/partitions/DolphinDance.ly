
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

title = #"Dolphin Dance"
composer = #"Herbie Hancock"
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
es1:7+ des:7+/es es:7+ d2:m5-7 g:9- 
c1:m7 as:7+9.11+ c:m7 a2:m7 d:7
g1:7+ as:m7 f:m11 f:m/bes 
c:m7 s a:m11 d:13

g:7+ g:13sus4 a/g es:5-7+ 
f:13sus4 f:9-13 f:13sus4 e2:m9 a:13
es1:9.11+ a2:m7 d:13 b1:m7 e2:13 d:m7 
cis1:m7.11 ges:13 d:7+/e c:7+/e
d:7+/e c:7+/e des:7+/es bes:9-13/es 
c:9+/es g:8
d:7+/e c:7+/e d:7+/e
}


theNotes =  \relative c'' {
  \clef "treble" \key es \major \time 4/4
    \override Rest #'staff-position = #0

\Intro
r2 g8( as bes f ~
f1)
r2 g8( as bes f ~
f1) \bar "||" 
\AetS
r2 es8( f) r g
d4-. d2.-- 
r2 es8( f g d ~
d2. c4 \break
b4. fis'8 ~ fis2 ~
fis8) ges4 ges8( as ges as bes) ~ 
bes1 ~
bes2 r  
g4.( bes8 ~ bes2
bes4-- bes8 bes c bes c d ~
d1 ~
d2) r 
\tweak self-alignment-X #RIGHT
\B \bar "||"  \break
r2 b8( c d a ~
a1 ~
a4) r g8( a b f8 ~ 
f1)  
r2 es8( f) r g 
d4-^ d2.--
r2 es8( f g a ~
a1)  \break
\times 2/3 { a4( bes a8 g } a4 a8 d)
r8 b4.-> ~ b4 r
\times 2/3 { b4( cis b8 a } b4 b8 e ~
e2 f  
ges4. e8) r b r as!(
es'2. ges,8 b ~ 
b1 ~
b1 ~
b4) r \once \override TextScript #'extra-offset = #'( 6 . -1 ) r2
^\markup  { \with-color #red { "To Coda" \musicglyph "scripts.varcoda" } }
R1 
\C
\bar "||" \break 
r2 c8( des es bes ~
bes1)
r2 g8( as bes f ~| f1) \bar "|."
\Coda \comp #8 \improvisationOn b1 \fermata
  \bar "|."
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup \with-color #red "Solo sur AB, C en interlude, puis D.S al Coda"
}

grille = \chordmode {

 es1:7+ des:7+/es es:7+ \/d2:m5-7 g:9- \break   \bar "[|:"
 c1:m7 as:7+9.11+ c:m7 \/as2:m7 d:7 \break
 g1:7+ as:m7 f:m11 f:m/bes \break
 \repeat percent 2 c:m7 a:m11 d:13 \break
 g:7+ g:13sus4 a/g es:5-7+ \break
 f:13sus4 f:9-13  f:13sus4 \/e2:m9 a:13 \break 
 es1:11+ \/a2:m7 d:13 b1:m7 \/e2:13 d:m7  \break
 cis1:m7.11 ges:13 d:7+/e c:7+/e \break
 d:7+/e c:7+/e \bar ":|]" \stopStaff s \bar "" s \bar ""  \break \startStaff 
 des:7+/es bes:9-13 c:9+ g:8
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 Intro s1*3 
  s1 ^\markup \bold \box \fontsize #7 A s1*11 
  s1 ^\markup \bold \box \fontsize #7 B s1*19 
  s1 ^\markup \bold \box \fontsize #7 C
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  %\header { meter = \markup \with-color # red "partition sur 2 pages" }
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
  %\header { meter = \markup \with-color # red "partition sur 2 pages" }
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
  %\header { meter = \markup \with-color # red "partition sur 2 pages" }
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
        \new Staff \with { instrumentName = \CleSol } 
        <<
         \theNotes \\ 
         { \repeat unfold 7 { s1*4 \break } s1*6 \break s1*4 \break } 
      >> >>
%   }   
%   \markup \pad-markup #2 " "
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
        \new Staff \with { instrumentName = \Bb } <<
          \transpose c d \theNotes \\ 
         { \repeat unfold 7 { s1*4 \break } s1*6 \break s1*4 \break }
      >> >>
%   }   
%   \markup \pad-markup #2 " "
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
          \transpose c a \theNotes \\ 
         { \repeat unfold 7 { s1*4 \break } s1*6 \break s1*4 \break }
      >> >>
%   }   
%   \markup \pad-markup #2 " "
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