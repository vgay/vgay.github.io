
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

title = #"Love For Sale"
composer = #"Cole Porter"
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
  es1*2:7+ bes:m7 es:7+ bes:m7 
  es1:m7 as:7 des:7+ ges:7 c:m5-7 b:5-7 bes:m6 s
  des:7+ ges:7 c:m5-7 b:5-7 bes:m6 s
  es:m7 as:7 des1:7+ f2:m5-7 bes:9- es1:m7 as:7 des1.:7+
  
  ces2:7+ bes1:7 b2:7 bes:7 es1*2:m6
  g2:m5-7 c:9- g2:m5-7 c:9- fis:m7 b:7 f:m5-7 bes:9-
   es1*2:7+ bes:m7 es:7+ bes:m7 
  es1:m7 as:7 
  des1:7+ ges:7 c:m5-7 b:5-7 bes:m6 s
}


theNotes =  \relative c'' {
  \clef "treble" \key bes \major \time 4/4
  \showStartRepeatBar \bar "[|:"
  \repeat volta 2 {
    \A 
    \new Voice = "mI"
    bes1~ | bes2. g4 | f1 ~ | f
    r4 bes8 8 4 4 | << { \voiceOne es4^\markup "(2nd x)"  c bes } \new Voice = "mII" { \voiceTwo \once \override TextScript #'extra-offset = #'( 0.2 . 1.5 ) bes4 _\markup "(1st x)" 2 } >> \oneVoice g4 | f1~ | f
    r4 bes8 8 4 4  | 4 c4 2 | \break
  }
  \alternative {
    { r4 as8 8 4 4 | \set Score.repeatCommands = #'((volta #f)) 4 ges4 2 |
      f1~ | f2. des4| bes1~ | bes2. r4  }
    { r4 des'8 8 4 4 | \set Score.repeatCommands = #'((volta #f)) 4 ges,4 2 | f1~ | 
      f2 des4. bes8~ | bes1~ | bes2. r4  \break }
  }
  \B \bar "||" \break
  r4 bes8 c des4 es  | f es es2 | r4 c8 des es4 f | as1
  r4 bes,8 c des4 es | f es es2 | r4 c8 des es4 f | bes1
  r4 bes,8 c d4 f | ges f f2 | r4 d \times 2/3 { es f ges } | c4 bes bes2
  des2 c | des  c | r4 b8 b b4 4 | 2  bes2 \break  \bar "||"
  \A bes1~ | bes2. g4 | f1 ~ | f
    r4 bes8 8 4 4 | bes4 2 g4 | f1~ | f \break
  r4 bes8 8 4 4  | 4 c4 2  
  r4 des8 8 4 4 | des4 es es2 | f1~ | f2 des | bes1~ | bes2. r4
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
 \repeat percent 2 es1:7+ \repeat percent 2 bes:m7 \break
 \repeat percent 2 es:7 \repeat percent 2 bes:m7 \break
 es:m7 as:7 des:7+ ges:7 \break
 c:m5-7 b:5-7 \repeat percent 2 bes:m6 \bar ":|]" \break
 es:m7 as:7 des:7+ \/f2:m5-7 bes:9- \break
 es1:m7 as:7 des:7+ \/des2:7+ ces:7+ \break
 bes1:7 \/b2:7 bes:7 \repeat percent 2 es1:m6 \break
 \/g2:m5-7 c:9- \/g2:m5-7 c:9- \/fis:m7 b:7 \/f:m5-7 bes:9-
 \repeat percent 2 es1:7+ \repeat percent 2 bes:m7 \break
 \repeat percent 2 es:7 \repeat percent 2 bes:m7 \break
 es:m7 as:7 des:7+ ges:7 \break
 c:m5-7 b:5-7 \repeat percent 2 bes:m6 
 
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*15 
  s1 ^\markup \bold \box \fontsize #7 B s1*15 
  s1 ^\markup \bold \box \fontsize #7 A
}

verse = \lyricmode {

  Love for sale
  Ap -- pe -- ti -- zing young love \skip 1 for sale
  Love that's fresh and still uns -- poiled
  Love that's on -- ly sligh -- tly soiled
  Love for sale
  For a trip to pa -- ra -- dise?
  Love for sale
  Let the po -- ets pipe of love
  In their chil -- dish way
  I know ev' -- ry type of love
  Bet -- ter far than they

  If you want the thrill of love
  I've been through the mill of love
  Old love, new love
  Ev' -- ry love but true love

  Love for sale
  Ap -- pe -- ti -- zing young love for sale
  If you want to buy my wares
  Fol -- low me and climb the stairs
  Love for sale.  
}

verseB = \lyricmode {
    Who will buy?
  Who would like to sam -- ple my sup -- ply?
  Who's pre -- pared to pay the price

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