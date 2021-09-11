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

title = #"Sous le ciel de Paris"
composer = #"Hubert Giraud"
meter = #"(Jazz Waltz)"
kwtempo = #"Medium"
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
  }
}

theNotes = \relative c' {
  \key as \major \time 3/4
  \A
  \showStartRepeatBar \bar "[|:"
  \repeat volta 2 {
    \A c4 f g | as2 bes4 | c bes as | g f es |
    des2. | c' | bes~ | bes2 r4 | \break
    c,4 e f | g2 a4 | bes des c | bes as g | f2.~ | 
  }
  \alternative {
    { f2.~ | f2. | R2. \bar ":|]" } 
    { f2.\repeatTie ~ | f2 r4 | | g as g  } }
  \bar "||" \break 
  \B f2. | f | f | g4 as g | f2. | f | f | g4 as g | \break
  f2 g4 | as2 bes4 | c des es | des c bes| c2.~ | c~ | c~ | c4 r2 \break
     \A c,4 f g | as2 bes4 | c bes as | g f es |
    des2. | c' | bes~ | bes2 r4 | \break
    c,4 e f | g2 a4 | bes des c | 
 
    \Coda bes4 a g | a2.~ | a2.~ | a2. | R2. \bar "|." 
    
   \break \Coda bes4 as g | f2.~ | f2.~ | f2.~ | f2. \bar ".."
     }


harmonies = \chordmode {
  f2.*4:m7 bes2.:m7 bes:m7/as bes:m6/g bes:m7/f
  c2.*4:7 f2.:m f:m/es bes:m7/des c:7
  bes2.:m7 f:m r bes:m7 s es:7 s as:6 s s s
  des bes:m7 g:5-7 s c:7 c:7/bes f:m/as c:7/g
   f2.*4:m7 bes2.:m7 bes:m7/as bes:m6/g bes:m7/f
  c2.*3:7 
  
  c2.:7 a2.*4:6
  c2.:7 f:m bes:m7 f:m
}

grille = \chordmode {
  \bar "[|:"
  \repeat percent 4 { f1:m7 } \break
  bes:m7 
  bes:m/as
  bes:m/g
  bes:m7/f \break
  \repeat percent 4 { c1:7 } \break
  \set Score.repeatCommands = #'((volta "1"))
  f:m \set Score.repeatCommands = #'((volta #f)) 
  f:m/es
  bes:m7/des
  c:7
  
  \bar ":|]" \break

  \set Score.repeatCommands = #'((volta "2"))
  f:m \set Score.repeatCommands = #'((volta #f)) 
  bes:m7
  f:m
  r \bar "||" \break 
  \repeat percent 2 { bes:m7 }
  \repeat percent 2 { es:m7 } \break
  \repeat percent 4 { as:m7 } \break
  des
  bes:m7
  \repeat percent 2 { g:5-7 } \break
  c:7
  c/bes
  f:m/as
  c:7/g 
  \set Score.repeatCommands = #'((volta #f)) \break
  \bar ":|]"
  \set Score.repeatCommands = #'((volta "3"))
  \Coda
  c:7 \set Score.repeatCommands = #'((volta #f)) 
  \repeat percent 3 { a:6 } \bar "|." \break
  \Coda
  f:m
  bes:m7
  \repeat percent 2 { f:m }
  \bar ".."
}

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*19 
  s1 ^\markup \bold \box \fontsize #7 B s1*11 
%   s1 ^\markup \bold \box \fontsize #7 C
}

verse = \lyricmode {
Sous le ciel de Pa -- ris
S'en -- vo -- l'u -- ne chan -- son
Hum Hum
Elle est née d'au -- jour -- d'hui
Dans le coeur d'un gar -- çon
 \repeat unfold 4 { \skip 1 } de Ber -- cy 
Un phi -- lo -- sophe as -- sis
Deux mu -- si -- ciens quel -- ques ba -- dauds
Puis les gens par mil -- liers
Sous le ciel de Pa -- ris
Jusqu' -- au soir vont chan -- ter
Hum Hum
L'hym -- ne d'un peupl' é -- pris
De sa vieil -- le ci -- té
vieil -- le ci -- té
}

verseB = \lyricmode {
  Sous le ciel de Pa -- ris
Mar -- chent des a -- mou -- reux
Hum Hum
Leur bon -- heur se cons -- truit
Sur un air fait pour eux \skip 1

Sous le pont 
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
          \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes
          \addlyrics \verse
          \addlyrics \verseB
      >> >>
  } }
    \bookpart {
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

  } }
    \bookpart {
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
            \new Voice = "PartPOneVoiceOne" { \transpose c a \theNotes }
          \addlyrics \verse
          \addlyrics \verseB
      >> >>
  }  } 
  \bookpart {
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