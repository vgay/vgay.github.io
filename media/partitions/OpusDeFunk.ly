
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

}

title = #"Opus de Funk"
composer = #"Horace Silver"
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
  asplayed = #"Horace Silver" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=qorFNS_Rvws"
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
  %\override NonMusicalPaperColumn #'page-break-permission = ##f
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
  s4. bes1 s8 bes4.:dim7 bes2:7 a1:m7 r1 r1*4 
  f1:6 g2:m7 c:7 f1:6 c2:m7 f:7 bes1:7 b:dim7
  f:6 a2:m7 d:7 r1*4
  f2:6 a:7 d:m7 des:5+7 c1:m7 f:7
  bes:7 b:dim7 f2:6/c \parenthesize bes:7 a:m7 d:7
  r1*4 s4. f1:5-7 
}


theNotes =  \relative c' {
  \clef "treble" \key f \major \time 4/4
 \partial 4.
  \Intro cis8 \times 2/3 { d f a }
  c a bes c cis d g ges | f b, r4 as8 b e d | 
  c a bes gis a fis g f | fis a c d es f16 es d8 c | \break  \noPageBreak
  bes f' \times 2/3 { d bes a } gis b e d | c a bes gis a c, e f |
  r c \times 2/3 { f a d } c a bes gis \toCoda | a f c ces bes g' fis e \bar "||" \break \noPageBreak
  \A f! c r4 g'8 e f g | a c, r4 a'8 f bes b | 
  c <c f>4.-> <as ces>4 <g bes>8 <es a>~ | <es a>2. r8 e \break \noPageBreak
  f bes, r4 g'8 e f g | as f c ces bes g' e f |
  r4 bes8 gis a f c bes | a2 r8 f' \times 2/3 { a c d } \break
  <c f>-> <c f> <c f> <c f> es c <c f>-> <c f> | <c f> <c f> e c bes as bes as
  <f bes> as  <f bes> as  <f bes> as f f | r4. <gis, gis'>8 a c d c \bar "||" \pageBreak
  \B f c r c cis a' g e | f d r f a f bes b |
  c <c es>4.-> <as ces>4 <g bes>8 <es a>~ | <es a>2. r8 e \break
 f bes, r4 g'8 e f g | as f c ces bes g' e f |
  r4 bes8 gis a f c bes | a2 r8 f' \times 2/3 { a c d } \break
  <c f>-> <c f> <c f> <c f> es c <c f>-> <c f> | <c f> <c f> e c bes as bes as
  <f bes> as  <f bes> as  <f bes> as f \once \override TextScript #'extra-offset = #'( 5 . 0 ) f _\markup "Solo Pick Up" | 
  \comp 4   \bar "||" \break
    \doubleMark 
  \markup {\with-color #(x11-color 'red) \bold "Chorus sur grille Blues puis A-B-Intro-Coda"}
  \markup { \with-color #(x11-color 'red) \fontsize #2 \musicglyph "scripts.varcoda" }
   a8 c d f-> ~ f4 a8 f~ | f4 a8 f-> ~ f4 a8 f-> ~ | f2 r8 c f bes | 
  <es, a>4 <es a> <des f> <des f> | <b f'>-- r2. \bar ".."
}

grille = \chordmode {
  \bar "[|:"
 f1:6 \/ g2:m7 c:7 \startStaff f1:6 \/ c2:m7 f:7 \startStaff \break
 bes1:7 b:dim f:6 \/ a2:m7 d:7 \startStaff \break
 g1:m7 c:7 f:6  \/ g2:m7 c:7
  \bar ":|]" }

marques = \relative c' { 
  s1 %^\markup \bold \box \fontsize #7 "Blues en Fa" 
}

Basse = \relative c {
  \clef "bass" \key f \major \time 4/4
 \partial 4. r4.
 \improvisationOn
 d4-> r r2 | r8 d-> r4 d-> r | d-> r r2 \improvisationOff
 d2 ~ d4. g,8~ | g a4. bes4 b | r4 c2 c8 \once \override TextScript #'extra-offset = #'( 5 . 0 ) g ^\markup "Break-----------------------------------------------------" 
 R1*2 s1*8
 g4. a8~ a4 bes~ | bes8 b4. c2 | c1~ | c |
 s1*8
  g4. a8~ a4 bes~ | bes8 b4. c2 | c1 | R
  \improvisationOn r4. d8~ d4. d8~ d4. d8~ d4.d8~ | d1~ | d \improvisationOff
  r8 b c g r2
 
 }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
   \header { meter = \markup \with-color #red "Partitions sur 2 pages" }
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
    page-count = #2
  }
   \header { meter = \markup \with-color #red "Partitions sur 2 pages" }
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
       { \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
        \mark \markup \box "Blues en Sol" 
        \transpose c d \grille }      >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
   \header { meter = \markup \with-color #red "Partitions sur 2 pages" }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
            \new Voice  \transpose c a \theNotes
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
      >> 
      \new Staff \with { \RemoveEmptyStaves } \Basse
      >>
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
        { \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
        \mark \markup \pad-markup #2 \box "Blues en Fa" 
        \grille }
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
       { \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
        \mark \markup \pad-markup #2 \box "Blues en Sol" 
        \transpose c d \grille }      >>
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
       { \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
        \mark \markup \pad-markup #2 \box "Blues en Ré" 
        \transpose c a \grille }      >>
} } }