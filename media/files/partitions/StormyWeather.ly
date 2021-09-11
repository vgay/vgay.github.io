
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

title = #"Stormy Weather"
composer = #"Harold Arlen"
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
s4 es2:7+ c:9- f:m7 bes:7 g:m7 c:9- f:m7 f:m7/bes g:m7 fis:7 f:m7 bes:5+7 
es:7+ c:9+ f:m7 bes:9- es1.:7+ a2:9-
as2:7+ a:dim7 es1/bes as2:7+ a:dim7 es/bes es:7 as2:7+ a:dim7 es/g c:m7 g:m7 c:m7 f:7 bes:9-
es2:7+ c:9- f:m7 bes:7 g:m7 c:9- f:m7 f:m7/bes g:m7 fis:7 f:m7 bes:5+7 
es1*2:7+
}


theNotes =  \relative c' {
  \clef "treble" \key es \major \time 4/4
\partial 4 fis8 g
\repeat volta 2 {
  \A
  bes2. fis8 g | bes g bes a as4 fis8 g | bes bes,4. ~ bes2 | f'8 f f f f4 es8 c | \break
  es bes4. ~ bes2 | as8 c es fis ~ fis4. fis8 | 
}
\alternative {
  { g( es4.) ~ es2 ~ | es2 r4 fis8 g }
  {g( es4.) ~ es4 es | c8( bes4.) ~ bes2 }
}
\bar "||" \break
\B
c8 d \times 2/3 { es f es ~ } es es es es | es4. es8 g es4. | c8 d \times 2/3 { es f es ~ } es es es es | es4. es8 c bes4.  \break
c8 d \times 2/3 { es f es ~ } es es es es | es4. es8 as g4. | bes4 g8 f es4 c | f2. fis8 g | \bar "||" \break
\A
bes2. fis8 g | bes g bes a as4 fis8 g | bes bes,4. ~ bes2 | f'8 f f f f4 es8 c | \break
es bes4. ~ bes2 | as8 c es fis ~ fis4. fis8 | g( es4.) ~ es2 ~ | es2 r2
\bar "|."
}

grille = \chordmode {
  \bar "[|:"
 \/es2:7+ c:9- \/f:m7 bes:7 \/g:m7 c:9- \/f:m7 f:m7/bes \break
 \/g:m7 fis:7 \/f:m7 bes:5+7 
 \set Score.repeatCommands = #'((volta "1")) \/es:7+ c:9+ \s f:m7 bes:9-
 \set Score.repeatCommands = #'((volta #f) end-repeat) \break
 \stopStaff s1 \bar "" s \set Score.repeatCommands = #'((volta "2"))
 \startStaff es1:7+ \/es2:7+ a:9- \set Score.repeatCommands = #'((volta #f)) \bar "||" \break
 \/as:7+ a:dim7 \startStaff es1/bes \/as2:7+ a:dim7 \/es/bes es:7 \break
 \/as:7+ a:dim7 \/es/g c:m7 \/g:m7 c:m7 \/f:7 bes:9- \bar "||" \break
 \/es2:7+ c:9- \/f:m7 bes:7 \/g:m7 c:9- \/f:m7 f:m7/bes \break
 \/g:m7 fis:7 \/f:m7 bes:5+7 \startStaff \repeat percent 2 es1:7+
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*11
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A
}

verse = \lyricmode {
  Don't know why
There's no sun up in the sky
Stor -- my wea -- ther __
Since my man and I ain't to -- ge -- ther __
Keeps rai -- ning all __ the time __
Life is \repeat unfold 3 { \skip 1  }


When he went a -- way
The blues walked in and met me
If he stays a -- way, old roc -- king chair will get me
All I do is pray
The lord a -- bove will let me
Walk in the sun once more

Can't go on
E' -- ry -- thing I had is gone
Stor -- my wea -- ther __
Since my man and I ain't to -- ge -- ther __
Keeps rai -- ning all __ the time __


}

verseB = \lyricmode {
  \skip 1 \skip 1 
bare
Gloom and mis' -- ry ev' -- ry -- where
Stor -- my wea -- ther __
Just can't get my poor self to -- ge -- ther __
I'm wea -- ry all __ the \repeat unfold 3 { \skip 1  } time, __ the time __

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
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d' \theNotes
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
          \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes
          \addlyrics \verse
          \addlyrics \verseB
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
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d' \theNotes
          \addlyrics \verse
          \addlyrics \verseB
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
          \new Voice  \transpose c a \theNotes \addlyrics \verse         
          \addlyrics \verseB
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