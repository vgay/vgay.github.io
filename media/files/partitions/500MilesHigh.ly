
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

title = #"500 Miles High"
composer = #"Chick Corea"
meter = #"(Med. Rock)"
kwtempo = #"Medium"
kwstyle = #"Rock"

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
  asplayed = #"Chick Corea and Return to Forever" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=UD21FG2Nmcw"
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
r8*5 c1*2:m7 b:9+
e:m7 g:6.9 bes:7+ b1:m5-7 e:9+
a1*2:m7 fis:m5-7 f:m7 c:m7 b:9+
b1:9+ f1*2:m7/bes a:9+ es1*2:m7/as g:9+ ges1:7+11+
}


theNotes =  \relative c'' {
  \override MultiMeasureRest #'staff-position = #0
  \override Rest #'staff-position = #0
  \clef "treble" \key c \major \time 4/4
  \Intro \partial 8*5 g8 d'( e-.) as,-. d \bar "||" c1^~ | c2. r4 |
  R1 | r2 r4 d \break
  \A
  \repeat volta 2 { 
  b1 | r4 b,8 d  \tuplet 3/2 { a'4 fis d } |
  e1 | r4 d'8 c \tuplet 3/2 { a4 f d } | \break
  g1~ | 2~ 4. f8 |
  f4 e8 g~ 2~ | 2 g4 e \bar "||" \break
  \B d'1~ | 2~ 4. c8 |
  c4 b8 d~ 2~ | 2~ \tuplet 3/2 { 4 c b } \break
  bes4 as8 c~ 2 | r4 r8g8 d' e-. as,-. d | 
  c1^~ | c2. r4 |
  R1 | \Coda r2 r4 \parenthesize d \break   }
  \Coda
  r4 r8 g,8 d' e-. as,-. d | 
  %\mark \markup {  \pad-markup #5 " "  }
  c1^~ | c2. r4 | R1 | r4 r8g8 d' e-. as,-. d | \break
  c1^~ | c2. r4 | R1 | r4 r8g8 d' e-. as,-. d |
  c1 \fermata \bar ".."

}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #-7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
  \partial 8*5 s8*5  r4 r8 c~-> 2 | s1 | 4.-> 8-> r4 4->
  s1*15 r4 r8 c~-> 2 | s1 | 4.-> 8-> r4 4->
  s1*2 \mark \markup {  \pad-markup #5 " "  } r4 r8 c~-> 2 | s1 | 4.-> 8-> r4 4-> |
  s1 r4 r8 c~-> 2 | s1 | 4.-> 8-> r4 4-> |
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key f \major \time 4/4
}

grille = \chordmode {
  \bar "[|:"
 \repeat percent 2 e1:m7 \repeat percent 2 g:6.9 \break
 \repeat percent 2 bes:7+ b:m5-7 e:9+ \break \bar "||"
 \repeat percent 2 a:m7 \repeat percent 2 fis:m5-7 \break
 \repeat percent 2 f:m7 \repeat percent 2 c:m7 \break
 \repeat percent 2 bes:9+ \bar ":|]"
 \stopStaff s1 \bar "" s1 \bar ""
   }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*7 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
}


verseA = \lyricmode {
  \repeat unfold 5 { \skip 1 }
Some day you'll look in to her eyes
Then there'll be no good -- byes
And ye -- ster -- day will have gone
You'll find your -- self in an -- o -- ther space
five hun -- dred mi -- les high You'll
}

verseB = \lyricmode {
  \repeat unfold 6 { \skip 1 }
 see just one look and you'll know
She's so ten -- der and warm
You'll re -- cog -- nize this is love
You'll find your -- self on an -- o -- ther plane
five hun -- dred mi -- les high Be 
}

verseC = \lyricmode {
  \repeat unfold 6 { \skip 1 }
sure that you love stays so free
Then it ne -- ver can die
Just re -- a -- lize this is truth
A -- bove the skies you will al -- ways stay
five hun -- dred mi -- les high  \skip 1
five hun -- dred mi -- les high
five hun -- dred mi -- les high
five hun -- dred mi -- les high
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
          \transpose c a, \theNotes
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
          << { \theNotes } 
             \addlyrics \verseA 
             \addlyrics \verseB
             \addlyrics \verseC
             \\ { \chordsRhythm } >>
         
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
          << { \transpose c d \theNotes } 
             \addlyrics \verseA 
             \addlyrics \verseB
             \addlyrics \verseC
             \\ { \chordsRhythm } >>
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
          << { \transpose c a, \theNotes } 
             \addlyrics \verseA 
             \addlyrics \verseB
             \addlyrics \verseC
             \\ { \chordsRhythm } >>
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
