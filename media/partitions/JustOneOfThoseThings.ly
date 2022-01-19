
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

title = #"Just One Of Those Things"
composer = #"Cole Porter"
meter = #"(Bright Swing)"
kwtempo = #"Fast"
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
  s2 d1*2:m e1:m a:7 f1*2:7 b1:m5-7 bes:m6 
  f/a d:m g:m c:7 f:7+ fis:m5-7 g:m e2:m5-7 a:9+
  f1/a d:m g:m c:7 f:7+ fis:dim f:m bes:7
  es:7+ e:m5-7 f:m bes:7 es1*2:7+ d1:m g:7 
  c1:7+ a:m fis:m5-7 f:m7+ e:m fis:dim g:m e2:m5-7 a:9+
  d1*2:m e1:m a:7 f1*2:7 b1:m5-7 bes:m6 
  a:m d:7 g:m c:7 f1*2:7+ e1:m5-7 a:9+
}


theNotes =  \relative c'' {
  \clef "treble" \key f \major \time 4/4
  \partial 2 bes4 a \A
  \repeat volta 2 { 
    a2 r4 a ~ | a gis a2 | a1~ | a2. r4  |
    a2 r4 a ~ | a gis a2 | a a4 g ~ | g2. \parenthesize 4 | \break
  }
  \alternative {
    { g4 e f2 | \set Score.repeatCommands = #'((volta #f)) c'2. f,4 | f d f2 | e1  |
      d2 r4 d ~ | d cis d2 | c1 ~ | c2 bes'4 a \break }
    {  \times 2/3 { g2 e f } | \set Score.repeatCommands = #'((volta #f)) d'2. c4 | \times 2/3 { f,2 d f } | e1 |
       d2 r4 d ~ | d cis d2 | c1 ~ | c4 c2 bes4
       \bar "||" \break
       \B
       g'2 g4 g ~ | g fis2 g4 | c2 c4 c~ | c b2 bes4  |
       c,2 d4 es~ | es f2 fis4 | g1 ~ | g2 g4 gis \break 
       a2 a4 a~ | a gis2 a4 | e'2 e4 e~ | e es2 d4  | 
       d2 r4 d~ | d c a2 | c1~ | c2 bes4 a \break \bar "||"
       \A a2 r4 a ~ | a gis a2 | a1~ | a2. r4  |
       a2 r4 f'~ | f d2 c4 | a gis a g ~ | g2 fis4 g  | \break
       e'2 r4 d~ | d d, cis d | c'2 r4 bes~ | bes g a2  | 
       f1~ | f ~ | 
       \startParenthesis \parenthesize f ~ \endParenthesis \parenthesize f
       \bar "|."
    }
  }
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
 \repeat percent 2 d1:m e:m a:7 \break
 \repeat percent 2 f:7 b:m5-7 bes:m6 \break
 f/a d:m g:m c:7 \break
 f:7+ fis:m5-7 \set Score.repeatCommands = #'((volta "1"))
 g:m \s e2:m5-7 a:9+   \set Score.repeatCommands = #'((volta #f) end-repeat) \break
 \stopStaff s1 \bar "" s1 \startStaff  \set Score.repeatCommands = #'((volta "2"))
 f:m bes:7 \set Score.repeatCommands = #'((volta #f)) \break \bar "||"
 es:7+ e:m5-7 f:m bes:7  \break
 \repeat percent 2 es:7+ d:m7 g:7 \break
 c:7+ a:m fis:m5-7 f:m7+ \break
 e:m fis:dim7 g:m \/ e2:m5-7 a:9+ \break
  \repeat percent 2 d1:m e:m a:7 \break
 \repeat percent 2 f:7 b:m5-7 bes:m6 \break
 a:m d:7 g:m c:7  \break
\repeat percent 2 f:7+ \parenthesize e:m5-7 \parenthesize a:9+
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*19 
  s1 ^\markup \bold \box \fontsize #7 B s1*15 
  s1 ^\markup \bold \box \fontsize #7 A
}

verse = \lyricmode {
  It was just one of those things
Just one of those cra -- zy flings \skip 1
One of those bells that now and then rings
Just one of those things It was 

trip to the moon on gos -- sa -- mer wings
Just one of those things

If we'd thought a bit, of the end of it
When we star -- ted pain -- ting the town
We'd have been a -- ware that our love af -- fair
Was too hot, not to cool down

So good -- bye, dear, and A -- men
Here's ho -- ping we meet now and then
It was great fun
But it was just one of those things 
}

verseB = \lyricmode {
  \skip 1 \skip 1 just one of those nights
Just one of those fabu -- lous flights A
}

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "CTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes \\ { s2 s1*40 \pageBreak s1}
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "BbTab") 
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes \\ { s2 s1*40 \pageBreak s1}
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "EbTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a \theNotes { s2 s1*40 \pageBreak s1}
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