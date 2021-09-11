
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

title = #"Prelude To A Kiss"
composer = #"Duke Ellington"
meter = #"(Mod. Ballad)"
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
    voltaSpannerDuration = #(ly:make-moment 4 4)
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
  d2:9 g:9 c:7 f:7+ b:9 e:9 a:7 d:m7 d:m11 \tuplet 3/2 { g2:7 gis4:dim7 } a2:m7 d:13 
  d:m7 g:9- c2:7+ e4:m7 a:7 d2:m7 g:9- c2:7+ fis4:m5-7 b:7
  e2:7+ cis:m7 fis:m5-7 b:7 e:7+ cis:m7 fis:m7 b:7
  e2:7+ cis:m7 fis:m5-7 b:7 e:7 a:7 d4:m11 es:m11 e:m11 es:9
  d2:9 g:9 c:7 f:7+ b:9 e:9 a:7 d:m7 d:m11 \tuplet 3/2 { g2:7 gis4:dim7 } a2:m7 d:13
  d:m7 g:9- c2:7+
  \startParenthesis \parenthesize e4:m7 \endParenthesis \parenthesize a:7
}


theNotes =  \relative c'' {
  \clef "treble" \key c \major \time 4/4
  \showStartRepeatBar \bar "[|:"
  \repeat volta 2 {
    \A
    b4 bes a as | g a8 e~ \times 2/3 { e4 f g } | 
    gis g fis f | e f8 d~ d2 \break
    \times 2/3 { g4 g g } \times 2/3 { g gis a } | c, d'8 b~ b2 |
  }
  \alternative {
    { d,8 e f as~ as4 as8 a~ | a2. r4 }
    {d,8 e f as~ as4 a8 c,~ | c2. r4  }
  }
  \bar "||" \break
  \B r4 ais'8 b dis, e dis' cis | b a c,2 cis4 | 
  r4 fis8 fis fis4 e | r4 a8 a a2 \break
  r4 ais8 b dis, e dis' cis | b a c,2 cis4 | 
  e8 e4 e8~ e4 e8 e | g4 as a bes \break \bar "||"
  \A b4 bes a as | g a8 e~ \times 2/3 { e4 f g } | 
  gis g fis f | e f8 d~ d4 4 \break
  \times 2/3 { g4 g g } \times 2/3 { g gis a } | c, d'8 b~ b2 |   
  d,8 e f as~ as4 a8 c,~ | c2. r4 
\bar ".."
}

verse = \lyricmode {
  If you hear a song in blue
Like a flo -- wer cry -- ing for the dew __
That was my heart se -- re -- na -- ding you __
My pre -- lude to a "kiss_" \repeat unfold 6 { \skip 1 }



Though it's just a sim -- ple me -- lo -- dy
With no -- thing fan -- cy, no __ thing much
You could turn it to a sym -- pho __ ny
A Schu -- bert tune with a Ger -- shwin touch

Oh! How my love song gen -- tly cries
For the ten -- der -- ness with -- in your eyes __
My love is a pre -- lude that ne -- ver dies __ 
A pre -- lude to a kiss __
}

verseB = \lyricmode {
  If you hear a song that grows
From my ten -- der sen -- ti -- men -- tal woes __
That was my heart try -- ing to com -- "pose_" \repeat unfold 6 { \skip 1 }
A pre -- lude to a kiss __
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
  \bar "[|:" \/d2:9 g:9 \/c:7 f:7+ \/b:9 e:9 \/a:7 d:m7 \break
  \w d:m11 g4:7 gis:dim7 \/a2:m7 d:13 \/d:m7 g:9- 
  \set Score.repeatCommands = #'((volta "1"))
  \wa c:7+ e4:m7 a:7 \break
  \set Score.repeatCommands = #'((volta #f) end-repeat)
  \stopStaff s1 \bar "" s1 \bar "" s1 \startStaff  
  \set Score.repeatCommands = #'((volta "2"))
 \wb c2:7+ fis4:m5-7 b:7 \set Score.repeatCommands = #'((volta #f))
 \bar "||" \break
 \/e2:7+ cis:m7 \/fis:m5-7 b:7 \/e:7+ cis:m7 \/fis:m7 b:7 \break
 \/e2:7+ cis:m7 \/fis:m5-7 b:7 \/e:7 a:7 \x d4:m11 es:m11 e:m11 es:9 \break
  \/d2:9 g:9 \/c:7 f:7+ \/b:9 e:9 \/a:7 d:m7 \break
  \w d:m11 g4:7 gis:dim7 \/a2:m7 d:13 \/d:m7 g:9- \w c:7+ e4:m7 a:7
 
  \bar ".." }

marques = \relative c' { 
   s1 ^\markup \bold \box \fontsize #7 A s1*11 
   s1 ^\markup \bold \box \fontsize #7 B s1*7
   s1 ^\markup \bold \box \fontsize #7 A
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
          \theNotes \addlyrics \verse \addlyrics \verseB
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
          \transpose c d \theNotes \addlyrics \verse \addlyrics \verseB
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
          \transpose c a \theNotes \addlyrics \verse \addlyrics \verseB
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