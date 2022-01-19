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

title = #"There Will Never Be Another You"
composer = #"Harry Warren"
meter = #"(Med. Up Swing)"
kwtempo = #"Med. Up"
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
  asplayed = #"Chet Baker" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=SliPCNDJDkA"
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
    \ChordNames
    \override ParenthesesItem.font-size = #2
}}




harmonies = \chordmode {
  s4 es1*2:7+ d1:m5-7 g:9+ c1:m7 \parenthesize f:7 bes1:m7 es:7
  as:7+ des:11+ es:7+ c:m7 f1*2:7 f1:m7 bes:7
  a2:m5-7 d:7 es:6 as:11+ g:m7 c:9+ f:m7 bes:7 es:7+ \parenthesize bes:7
}


theNotes =  \relative c' {
  \clef "treble" \key es \major \time 4/4
  \partial 4 bes4
  \repeat volta 2 {
    c d es f | g bes f4. es8 | f1 ~ | f2. g4 |
    es f g bes | c es c4. bes8 | c1 ~ | c2. bes4 \bar "||" \break
    es c bes as | g f g4. as8 | bes4 g f es | 
    
  }
  \alternative {
    { f es f4. es8 | d'4 c bes a | g f g f | as1 ~ | as2. bes,4 \break }
    { d'2. c4 }
  }
    bes es d c | bes es, bes' as | f2 g | es1
  \bar "|."
}

verse = \lyricmode {
  There will be ma -- ny o -- ther nights like this __
And I'll be stan -- ding here with some -- one new __
There will be ot -- her songs to sing
A -- no -- ther fall, a -- no -- ther spring
But there will ne -- ver be an -- o -- ther you __
There 
}

verseB = \lyricmode {
\skip 1  will be o -- ther lips that I may kiss __
But they won't thrill me like yours used to do __
Yes \repeat unfold 26 { \skip 1 } I may dream a mil -- lion dreams
But how can they come true
If there will ne -- ver e -- ver be an -- o -- ther you 
}

grille = \chordmode {
  \bar "[|:"
\repeat percent 2 es1:7+ d:m5-7 g:9+ \break
c:m7 \parenthesize f:7 bes:m7 es:7 \break
  as:7+ des:9.11+ es:7+ 
  \set Score.repeatCommands = #'((volta "1"))
  c:m7 \set Score.repeatCommands = #'((volta #f)) \break 
  \repeat percent 2 f:7 f:m7   bes:7 
  \bar ":|]" \break
  \stopStaff s1 \bar "" s \bar "" s \startStaff
  \set Score.repeatCommands = #'((volta "2"))
  \/ a2:m5-7 d:7 
  \set Score.repeatCommands = #'((volta #f)) \break
\/ es:6 as:11+ \/ g:m7 c:9+ \/ f:m7 bes:7 \/es:7+ bes:7
  \bar ".."
}

marques = \relative c' { 
  s1 % ^\markup \bold \box \fontsize #7 A s1*7 
%   s1 ^\markup \bold \box \fontsize #7 B s1*7 
%   s1 ^\markup \bold \box \fontsize #7 A
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
          \addlyrics \verse
          \addlyrics \verseB
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
          \addlyrics \verse
          \addlyrics \verseB
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
          \addlyrics \verse
          \addlyrics \verseB
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
    } 
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
            \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes
          \addlyrics \verse
          \addlyrics \verseB
      >> >>

  }
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
            \new Voice  \transpose c a \theNotes
          \addlyrics \verse
          \addlyrics \verseB
      >> >>
  }   
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