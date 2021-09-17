
\version "2.22.0"
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

title = #"Samba Cantina"
composer = #"Paul Desmond"
meter = #"(Med. Bossa)"
kwtempo = #"Medium"
kwstyle = #"Bossa"

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
  asplayed = #"Paul Desmond" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=6vvgz_x5YUs"
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
  bes2:m7 bes/as g:m5-7 c:7 f:m7 f/es bes:7/d bes:m6/des
  c1:7sus4 c:7 f:m7 s
  g:m5-7 c:7 f:m7 s
  bes:m7 es:7 as:7+ s
  \B g:m5-7 c:7 f:m7 s
  d:m5-7 g:7 c1.:7 as2:7
  g1:m5-7 c:7 f:m7 s
  bes:m7 es:7 c:m7 f:7
  bes2:m7 bes/as g:m5-7 c:7 f:m7 f/es bes:7/d bes:m6/des
  c1:7sus4 \parenthesize c:9- f:m7 s
  c1.:7sus4 c2:9- f1:m7 f:m6 f1:m7 f:m6 f1:m7 f:m6 f1:m7 f:m6.9
}


theNotes =  \relative c' {
  \clef "treble" \key as \major \time 4/4
  \override Rest #'staff-position = #0
  \Intro 
  \comp #16  \comp #12 r2 \tuplet 3/2 { c4 f as }  \break 
  \AetS 
  g8 4.~ 4.  f8 | es8 4. ~ 4. des8 | c1 | r2 r8 c8 f c' | 
  bes bes4. ~ 4. as8 | g g4.~ 4 des' | c1 | r2 des8 c bes as \bar "||" \break
  c4 bes8 des,~ des2~ | 8 c es e f g4 as8~ | 1 | r4. g8( \grace a bes) as g f | 
  as4 g8 c,~ c4. d16 c | b4 f'2 g8 f | 
  e2. r4 | r4. c8 f4( \grace { ges16 g } as4) | \bar "||"  \break
  \C g8 4.~ 4.  f8 | es8 4. ~ 4. des8 | c1 | r2 \tuplet 3/2 { c4 f as } 
  bes4 2 as4 | g4 2 des'4 | c1~ | 4 r r r8 c \bar "||" \break
  \D es des4 c8~ 4. bes8 | des c4 bes8~ 4. as8 | 
  \grace b c4 bes as g | bes as g f   
  %\once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \toCoda 
  c4 f2 e8 d | e f4. r g8 | as g f f~ 2~ | 4 r r2 \bar "|." \break
  \DSalCoda
  c1 | r8 f e f g as bes g | as4. bes8~ 2~ | 4 r r8 c4. |  \break
  as4 bes8 8~ 2~ | 4 r g'8 f c bes | as4. bes8~ 2~ | 4 r r8 c4. | 
  as4 bes8 8~ 2~ | 1 \fermata \bar ".."
}



Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key f \major \time 4/4
}

grille = \chordmode {
  \/bes2:m7 bes/as \/g:m5-7 c:7 \/f:m7 f/es \/bes:7/d bes:m6/des \break
  c1:7sus4 c:9- \repeat percent 2 f:m7 
  \bar "[|:"
  g1:m5-7 c:7 \repeat percent 2 f:m7 \break
  bes:m7 es:7 \repeat percent 2as:7+ \break
  g1:m5-7 c:7 \repeat percent 2 f:m7 \break
  d:m5-7 g:7 c:7 \/c2:7 as:7 \break
  g1:m5-7 c:7 \repeat percent 2 f:m7 \break
  bes:m7 es:7 c:m7 f:7 \break
  \/bes2:m7 bes/as \/g:m5-7 c:7 \/f:m7 f/es \/bes:7/d bes:m6/des \break
  c1:7sus4 c:9- \repeat percent 2 f:m7 \bar ":|]"
  c1:7sus4 c:9- \bar "[|:" f:m7 f:m6 \bar ":|]"
}

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 Intro s1*7 
  s1 ^\markup \bold \box \fontsize #7 A s1*7 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 C s1*7
  s1 ^\markup \bold \box \fontsize #7 D s1*2
  \once \override TextScript #'extra-offset = #'( 28 . 0 )
  s1 ^\markup { \fontsize #2 \with-color #red \musicglyph "scripts.varcoda" } 
  s1*4
  s1 ^\markup { \with-color #red \fontsize #2 \musicglyph "scripts.varcoda" }  s1*2 
    \once \override TextScript #'extra-offset = #'( 25 . 0 )
  s1 ^\markup \bold \fontsize #5 4X
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
           << { \theNotes } \\ { s1*40 \pageBreak } >>
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
          << { \transpose c d \theNotes } \\ { s1*40 \pageBreak } >>
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
           << { \transpose c a \theNotes } \\ { s1*40 \pageBreak } >>
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
           << { \theNotes } \\ { s1*4 \break \repeat unfold 4 { s1*8 \break } 
           \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
           } >>
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
           << { \transpose c d \theNotes } \\ { s1*4 \break \repeat unfold 4 { s1*8 \break } 
           \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
           } >>
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
           << { \transpose c a \theNotes } \\ { s1*4 \break \repeat unfold 4 { s1*8 \break } 
           \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
           } >>
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

%{
convert-ly (GNU LilyPond) 2.22.0  convert-ly: Traitement de «  »...
Conversion en cours : 2.21.0, 2.21.2, 2.22.0
%}
