
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

title = #"Wiwes and Lovers (Hey Little Girl)"
composer = #"Burt Bacharachy"
meter = #"(Jazz Waltz)"
kwtempo = #"Med. Up"
kwstyle = #"Jazz Waltz"


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
  f2.:m7 bes:6 f:m7 bes:6 f:m7 bes:6 f:m7 bes:6 
  g:m7 c:7 g:m7 c:7 g:m7 c:7 g:m7 c:7 
  c:m7 f:7 a:m5-7 d:7 es:7+ s a:m7 d:7 des:7+ c:13sus4 s s
  f:m7 bes:6 f:m7 bes:6 f:m7 bes:6 es:6 e:dim7 
  f:m7 bes:6 f:m7 bes:6 f:m7 bes:6 es:7+ c:7
  f:m7 bes:6 f:m7 bes:6 f:m7 bes:6 as:7+ 
}


theNotes =  \relative c'' {
  \clef "treble" \key es \major \time 3/4
    \showStartRepeatBar \bar "[|:" \oneVoice
  \A \repeat volta 2 {
  c4 r g8 f | g4 r c,8 bes | c4 r c8 bes | c4 g'2 |
  c,2 c8 bes | c4 es c' | g2.~ | g \break
  d'4 r a8 g | a4 r d,8 c | d4 r d8 c | d4 a'2
  d,2 d8 c | d4 f d' | a2.~ | a2 g4 | \break
  c2 bes4 | d d2 | c4 bes c | d2. |
  d2 c8 d | f4. e8 d c | d4. c8 d c | d2 a4 |
  c2 bes4 | c2.~ | c ~ c }
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \mark \markup \with-color #red "Chorus sur A puis reprise du thème à B"
  \break
  \once \override TextScript #'extra-offset = #'( -3 . 0 ) 
  c4 ^\markup \bold \box \fontsize #4 "B" r g8 f | g4 r c,8 bes | c4 r c8 bes | c4 g'2 |
  c,2 c8 bes | c4 g'2 | c,2 c8 bes | c4 es g 
  c4 r g8 f | g4 r c,8 bes | c4 r c8 bes | c4 g'2 |
  
  c,2 c8 bes | c4 g'4 r8 c, | g'2.~ | g2 c4 | 
  c,4 r c8 bes | c4 g' r | c,4 r c8 bes | c4 g' r 
  c,2 c8 bes | c4 g'4 r8 c, | 
  es2.~ | es2 r4 
  \bar ".."
}

grille = \chordmode { 
  
  f1:m7 bes:6 f1:m7 bes:6 \break
  f1:m7 bes:6 f1:m7 bes:6 \break
  g1:m7 c:6  g1:m7 c:6 \break
  g1:m7 c:6  g1:m7 c:6 \break
  c:m7 f:7 a:m5-7 d:7 \break
  \repeat percent 2 es:7+ a:m7 d:7 \break
  des:7+ \repeat percent 3 c:13sus4 \bar "||"
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \mark \markup \with-color #red "Chorus sur A puis B"
  \bar "[|:" f1:m7 bes:6 f1:m7 bes:6 \break
  f1:m7 bes:6 \set Score.repeatCommands = #'((volta "1")) es:7+ e:dim7 \break
    \set Score.repeatCommands = #'((volta #f) end-repeat) 
    \stopStaff s \bar "" s \startStaff 
    \set Score.repeatCommands = #'((volta "2")) es:7+ c:7
    \set Score.repeatCommands = #'((volta #f)) \break
   f1:m7 bes:6 f1:m7 bes:6 \break
    f1:m7 bes:6 \repeat percent 2 as:7+ \bar ".."
   }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*27 
  s1 ^\markup \column { \pad-around #2 " " \bold \box \fontsize #7 B }

}

verse = \lyricmode {
  Hey, lit -- tle girl
Comb your hair, fix your make -- up
Soon he will o -- pen the door __
Don't think be -- cause
There's a ring on your fin -- ger
You nee -- dn't try a -- ny more __

For wives should al -- ways be lo -- vers, too
Run to his arms the mo -- ment he comes home to you
I'm war -- ning you __ }

verseB = \lyricmode {
Day af -- ter day
There are girls at the of -- fice
And men will al -- ways be men __
Don't send him off
With your hair still in cur -- lers
You may not see him a -- gain __

For wives should al -- ways be lo -- vers, too
Run to his arms the mo -- ment he comes home to you
He's al -- most here __

Hey, lit -- tle girl
Bet -- ter wear some -- thing pret -- ty
Some -- thing you'd wear to go to the ci -- ty
And dim all the lights
Pour the wine, start the mu -- sic
Time to get rea -- dy for love __

Oh, time to get rea -- dy
Time to get rea -- dy
Time to get rea -- dy
For love __
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
          \theNotes
          \addlyrics \verse
          \addlyrics \verseB
          \\ { \repeat unfold 4 { s2.*4 \break } \repeat unfold 5 {s2.*6 \break  } }
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
          \transpose c d \theNotes
          \addlyrics \verse
          \addlyrics \verseB
          \\ { \repeat unfold 4 { s2.*4 \break } \repeat unfold 5 {s2.*6 \break  } }
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
          \transpose c a \theNotes
          \addlyrics \verse
          \addlyrics \verseB
          \\ { \repeat unfold 4 { s2.*4 \break } \repeat unfold 5 {s2.*6 \break  } }
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