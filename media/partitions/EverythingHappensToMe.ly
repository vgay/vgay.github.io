
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

title = #"Everything Happens To Me"
composer = #"Matt Denis"
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
  s8 c2:m9 f:7 d:m7 cis:dim c:m7 f4:7 \parenthesize es:7 
  d2:m5-7 g:7 b:dim7 c:m5-7 d:m7 g:9 c:m7 f:7 bes1:7+
  c2:m7 f:7 bes1:6
  f2:m11 bes:5+7.9-11+ es:7+ \parenthesize c:m7
  f2:m11 bes:5+7.9-11+ es1:7+ e2:m11 a:5+7.9-11+
  d:7+ \parenthesize b:m7 g:m7 c:7 f:9sus4 f:7
  c2:m9 f:7 d:m7 cis:dim c:m7 f4:7 \parenthesize es:7 
  d2:m5-7 g:7 b:dim c:m5-7 d:m7 g:9 c:m7 f:13 bes1:6
}


theNotes =  \relative c'' {
  \clef "treble" \key bes \major \time 4/4
   \partial 8 g8
  \repeat volta 2 {
    \A d' d d es c4 \tuplet 3/2 { c8 bes a } | c c c d bes4 r8 g |
    bes bes bes c a a g f | as as as bes g4 r8 d |
    f f f g es fis a bes | c c \tuplet 3/2 { c c a~ } a2 |
     }
  \alternative {
    { g8 g g a~ a a a f~ | f2. r8 g }
    { g g g a~ a a a bes ~ | bes2. r8 bes \bar "||"
    }
  }
  \bar "||" \break
  \B bes8 bes bes bes des des ces des | bes bes bes2 r8 bes |
  bes8 bes bes bes ces ges f es | bes'2. r8 bes | \break
  a a a a c! c bes c | a a a2 r8 a |
  bes8 bes bes bes bes bes a bes | c2. r8 g \bar "||" \break
  \A d' d d es c4 \tuplet 3/2 { c8 bes a } | c c c d bes4 r8 g |
    bes bes bes c a a g f | as as as bes g4 r8 d | \break
    f f f g es fis a bes | c c \tuplet 3/2 { c c a~ } a2 |
    g8 g g a~ a a a bes ~ | bes2. r4
  \bar ".."
}

chordsRhythm = \relative c''' {
\override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key f \major \time 4/4
}

grille = \chordmode {
  \bar "[|:"
  \/c2:m9 f:7 \/d:m7 cis:m5-7 \/c:m7 f:7 \/d:m5-7 g:7 \break
  \/b:dim7 c:m5-7 \/d:m7 g:9 \/c:m7 f:7 bes1:7+ \bar ":|]" \break
  \/f2:m11 bes:8 es1:7+ \/f2:m11 bes:8 es1:7+ \break
 \/e2:m11 a:8 d1:7+ \/g2:m7 c:7 \/f:9sus4 f:7 \bar "||" \break
   \/c2:m9 f:7 \/d:m7 cis:m5-7 \/c:m7 f:7 \/d:m5-7 g:7 \break
  \/b:dim7 c:m5-7 \/d:m7 g:9 \/c:m7 f:7 bes1:6 \bar ".."
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*7 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A
}
verse = \lyricmode {
  I make a date for golf, and you can bet your life it rains
I try to give a par -- ty, and the guy up -- stairs com -- plains
I guess I'll go through life, just cat -- ching colds and mis -- sing trains
Ev' -- ry -- thing hap -- pens to me

I \repeat unfold 8 { \skip 1 }

first, my heart thought you could break this jinx for me
That love would turn the trick to end des -- pair
But now I just can't fool this head that thinks for me
I've mort -- gaged all my cas -- tles in the air

I've te -- le -- graphed and phoned and sent an air mail spe -- cial too
Your an -- swer was good -- bye and there was e -- ven pos -- tage due
I fell in love just once, and then it had to be with you
Ev'  -- ry -- thing hap -- pens to me

}

verseB = \lyricmode {
  \skip 1 ne -- ver miss a thing. I've had the meas -- les and the mumps
And ev' -- ry time I play an ace, my part -- ner al -- ways trumps
I guess I'm just a fool, who ne -- ver looks be -- fore he jumps
\repeat unfold 8 { \skip 1 } Ev' -- ry -- thing hap -- pens to me. At
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