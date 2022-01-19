
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

title = #"My Heart Belongs To Daddy"
composer = #"Cole Porter"
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
    %voltaSpannerDuration = #(ly:make-moment 4 4)
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
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
  s4  c1*3:m d1:m5-7
  g1:9-  d2:m5-7 g:9-  d2:m5-7 g:9- c2.:m g4:5+7 c1:m
  c1*3:m g1:9- d:m5-7 g:9- d2:m5-7 g:9- c1:7+
  c1*2:7+ c2:7+/g ges:5-7 f1:7+ f:m7 c:7+ d2:m5-7 g:9- c:m \parenthesize g:9-
}


theNotes =  \relative c' {
  \clef "treble" \key es \major \time 4/4
  \partial 4 es4
  \repeat volta 2 {
    \A
    d es8 c~ c4 es | d es8 c~ c4 es | \times 2/3 { d es c } \times 2/3 { d es f } | g4. f8~ f4. f8 |
    fis g4 d'8~ d4. b8 | g fis f d~ d4 es8 f | g4 g8 g ~ g f4 es8~ 
  }
  \alternative {
    { es c4. r es8 }
    { es \repeatTie c4. r4 c'8 d }
  }
  \bar "||" \break
  \B
  es4 es8 es~ es4. d8 | d8 c4.~ c4 c8 d | 
  es4 es8 es~ es d4 c8 | d2. b8 c | \break
  d4 d8 d~ d4. c8 | c b4. \times 2/3 { r4 b as } | 
  \times 2/3 { g b as } \times 2/3 { g b as } | g2. c8 d \bar "||" \break
  \C
  e4 e8 e~ e4. d8 | d c4. ~ c4 c8 d | 
  e4 e8 e \times 2/3 { e4 d c } | a2. gis8 a | \break 
  c4 c8 bes~ bes as4 as8~ | as g4.~ g4 e8 f | 
  \times 2/3 { g4 g g } \times 2/3 { f es d }
  c2. r4 \bar "|." \break
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
  \bar "[|:" \repeat percent 3 c1:m d:m5-7 \break
  g:9- \/d2:m5-7 g:9- \/d2:m5-7 g:9- 
  \set Score.repeatCommands = #'((volta "1"))
  \w c2:m g:5+7   \set Score.repeatCommands = #'((volta #f) end-repeat)
  \break \stopStaff s1 \bar "" s1 \bar "" s \startStaff 
  \set Score.repeatCommands = #'((volta "2")) c1:m
  \set Score.repeatCommands = #'((volta #f)) \bar "||" \break
  \repeat percent 3 c1:m g:9- \break
  d:m5-7 g:9- \/d2:m5-7 g:9- c1:7+ \break
  \repeat percent 2 c:7+ \/c2:7+/g ges:5-7 f1:7+ \break
  f:m7 c:7+ \/d2:m5-7 g:9- \/c:m g:9-
 
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*11 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A
}

verse = \lyricmode {
  While tea -- ring off a game of golf
  I may make a play for the cad -- dy
  But when I do, I don't fol -- low through
  'cause my heart be -- longs to dad -- dy
  If \repeat unfold 4 { \skip 1 }

  heart be -- longs to dad -- dy, so I sim -- ply could -- n't be bad
  Yes my heart be -- longs to dad -- dy
  da -- da da -- da -- da da -- da -- da -- ad
  So I want to warn you lad -- die
  Though I know that you're per -- fect -- ly swell
  That my heart be -- longs to dad -- dy cause my dad -- dy he treats it so well
}
verseB = \lyricmode {
  \skip 1 I in -- vite a boy some night to dine on my fine fin -- nan had -- die
  I just a -- dore his as -- king for more, but
  My heart be -- longs to dad -- \repeat unfold 3 { \skip 1 } dy
  Yes, my
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
        \theNotes \addlyrics \verse \addlyrics \verseB
      >>
    } 
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
          \transpose c d \theNotes  \addlyrics \verse \addlyrics \verseB
        >> 
      >>
    }
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
          \transpose c a \theNotes \addlyrics \verse \addlyrics \verseB
        >> 
      >>
    } 
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