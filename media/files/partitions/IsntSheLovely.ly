
\version "2.22.0"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm

  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Isn't She Lovely"
composer = #"Stevie Wonder"
meter = #"(Med. Shuffle Rock)"
kwtempo = #"Medium"
kwstyle = #"Shuffle Rock"

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
  asplayed = #"Stevie Wonder" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=IVvkjuEAwgU"
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
  s2 cis1:m7 fis:7 b:7sus4 e:7+ cis1:m7 fis:7 b:7sus4 e:7+
  a:7+ gis:9- cis:m7 fis:7 b:7sus4 s e:7+ 
  \startParenthesis \parenthesize dis2:m \endParenthesis \parenthesize gis:9-
  e
}


theNotes =  \relative c'' {
  \clef "treble" \key e \major \time 4/4
  \partial 2 \tuplet 3/2 { gis4 a gis } \bar "||"
fis2 e | r \tuplet 3/2 { gis4 a gis } |
fis2 e4 cis8 b8~ | b2 \tuplet 3/2 { gis'4 a gis } \break
fis2 e | r \tuplet 3/2 { gis4 a gis } |
fis2 e4 cis8 b8~ | b2 \tuplet 3/2 { gis'4 a b~ } | \break
b4. gis8 a4 b8 a~ | a2~ \tuplet 3/2 { a4 gis gis } |
gis8 fis e fis~ fis4 e8 cis~ | cis4. b8 \tuplet 3/2 { gis'4 a gis } \break
fis2 e | cis b | \toCoda
e r | r  \tuplet 3/2 { \startParenthesis \parenthesize gis4 a \endParenthesis \parenthesize gis } 
\bar "|." \break
	\mark \markup \with-color #(x11-color 'red) {  \bold \larger \center-column {\pad-markup #2 " "  \pad-markup #0 \musicglyph "scripts.varcoda"} }
e4~ \tuplet 3/2 { e8 b cis } \tuplet 3/2 { e fis gis } \tuplet 3/2 { b cis e->~ } | e4 e-^ r2
  \bar ".."
}

grille = \chordmode {
   cis1:m7 fis:7 b:7sus e:7+ \break
   cis1:m7 fis:7 b:7sus e:7+ \break
   a:7+ gis:9- cis:m7 fis:7 \break
   \repeat percent 2 b:7sus e:7+ \/ dis2:m gis:9- 
  \bar ".." }

marques = \relative c' { 
  s1 % ^\markup \bold \box \fontsize #7 A s1*7 
%   s1 ^\markup \bold \box \fontsize #7 B s1*7 
%   s1 ^\markup \bold \box \fontsize #7 A
}

verse = \lyricmode {
  Is -- n't she love -- ly
Is -- n't she won -- der -- ful
Is -- n't she pre -- cious
Less than one mi -- nute old

I never thought through love we'd be
Ma -- king one as love -- ly as she
But is -- n't she love -- ly made from love
}

verseB = \lyricmode {
Is -- n't she pret -- ty
Tru -- ly the an -- gel's best
Boy, I'm so hap -- py
We have been hea -- ven blessed
I can't be -- lieve what God has done
Through us he's given life to one
But is -- n't she love -- ly made from love
}

verseC = \lyricmode {
Is -- n't she love -- ly
Life and love are the same
Life is A -- i -- sha
The mea -- ning of her name
Londie, it could have not been done
With -- out you who con -- ceived the one
That's so ve -- ry love -- ly made from love

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
          \addlyrics \verseC
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
          \addlyrics \verseC
      >> >>

  }
    \markup \pad-markup #2 " "
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
          \addlyrics \verseC
      >> >>
  }   
  \markup \pad-markup #2 " "
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

%{
convert-ly (GNU LilyPond) 2.22.1  convert-ly: Traitement de «  »...
Conversion en cours : 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}
